resource "azurerm_resource_group" "tfgroup_4" {
    name     = var.a_r_g
    location = "eastus"

    tags = {
        environment = var.environment
    }
}

resource "azurerm_virtual_network" "ourtfnetwork" {
    name                = "ourVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = azurerm_resource_group.tfgroup_4.name

    tags = {
        environment = var.environment
    }
}

resource "azurerm_subnet" "ourtfsubnet4" {
    name                 = "ourSubnet"
    resource_group_name  = azurerm_resource_group.tfgroup_4.name
    virtual_network_name = azurerm_virtual_network.ourtfnetwork.name
    address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "ourtfpublicip" {
    name                         = "ourPublicIP"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.tfgroup_4.name
    allocation_method            = "Dynamic"

    tags = {
        environment = var.environment
    }
}
#Creating a network security group
resource "azurerm_network_security_group" "ourtfnsg" {
    name                = var.net_sec_group //
    location            = "eastus"
    resource_group_name = azurerm_resource_group.tfgroup_4.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = var.environment
    }
}
#Creating virtual network adapters
resource "azurerm_network_interface" "ourtfnic" {
    name                        = var.n_i_c
    location                    = "eastus"
    resource_group_name         = azurerm_resource_group.tfgroup_4.name

    ip_configuration {
        name                          = "ourNicConfig"
        subnet_id                     = "${azurerm_subnet.ourtfsubnet4.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.ourtfpublicip.id}"
    }

    tags = {
        environment = var.environment//
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" { // ? to Sergiy
    network_interface_id      = azurerm_network_interface.ourtfnic.id
    network_security_group_id = azurerm_network_security_group.ourtfnsg.id
}

#Random text generation
resource "random_id" "randomId" {
    keepers = { # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.tfgroup_4.name
    }
    
    byte_length = 8
}
#Creating a save account for diagnostics
resource "azurerm_storage_account" "ourstorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.tfgroup_4.name
    location                    = "eastus"
    account_replication_type    = "LRS"
    account_tier                = "Standard"

    tags = {
        environment = var.environment
    }
}
#Creating a virtual machine
resource "azurerm_linux_virtual_machine" "ourtfvm" {
    name                  = "myVM"
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.tfgroup_4.name
    network_interface_ids = [azurerm_network_interface.ourtfnic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "azureuser"
    disable_password_authentication = true
        
    admin_ssh_key {
        username       = "azureuser"
        public_key     = file("/home/azureuser/.ssh/authorized_keys")
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.ourstorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = var.environment
    }
}
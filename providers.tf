# Configure the GitHub Provider
provider "github" {
	token        = "${var.github_token}"
	organization = "${var.github_organization}"
	//individual = false
}

provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
    
    subscription_id = var.subscription_id //xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
}
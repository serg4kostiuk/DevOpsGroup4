variable "github_token" {
	description = " used token to access github"
	type = string	
	//default = "./keys.json"
}

variable "github_organization" {
	type = string	
	default = "DevOpsStudies"
}
 variable "subscription_id" { 	//xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
	type = string
}
    variable "client_id" {
	type = string
}
    variable "client_secret"{
	type = string
}
    variable "tenant_id"{
	type = string
}
variable "a_r_g" {
	type = string
	default = "ResourceGroup4"
}
variable "environment" {
	type = string
	default = "DevOpsTeam_4"
}
variable "net_sec_group" {
	type = string 
	default = "ONSG"
}
variable "n_i_c" {
	type = string
	default = "NIC4Group"
}
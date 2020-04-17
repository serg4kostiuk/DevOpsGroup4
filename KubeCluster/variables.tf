variable "credentials_file_path" {
	type = string
	description = "1-st way"
	default = "f:/DevOps/Terraform/.gcloud/juice-shop-project-8f42062baada.json"
}
variable "name" {
	type = string
 	default = "cluster-4-team"
}
variable "project" {
	type = string
        default = "juice-shop-project" // what project I should choose
}

variable "region_type" {
	type = string
  	default = "europe-west6"
}

variable "init_node_count" {
  	default = 1
}

variable "machine_type" {
	type = string
	default = "e2-standard-4" //"n1-standard-1"  
}
variable "github_token" {
	description = " used token to access github"
	type = string	
}
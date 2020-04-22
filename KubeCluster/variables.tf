variable "name" {
	type = string
 	default = "cluster-4-team"
}
variable "project" {
	type = string
        default = "devops-274919" // what project I should choose
}

variable "region_type" {
	type = string
  	default = "europe-west1"
}

variable "init_node_count" {
  	default = 1
}

variable "machine_type" {
	type = string
	default = "n1-standard-1" //"n1-standard-1"
}
variable "github_token" {
	description = " used token to access github"
	type = string
}

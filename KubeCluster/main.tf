#resource "github_repository" "group4" {
#	name = "KubeCluster"
#      	description  = "RepoForKubeService"
#	private = false
#	auto_init = true
#}
resource "google_container_cluster" "default" {
     name        = "${var.name}"
     project     = "${var.project}"
     description = "First_GKE_Cluster"
     location    = "${var.region_type}"

  remove_default_node_pool = true
  initial_node_count = "${var.init_node_count}"

     master_auth {
       username = ""
       password = ""

       client_certificate_config {
         issue_client_certificate = false
       }
     }
}

resource "google_container_node_pool" "default" {
  name       = "${var.name}-node-pool"
  project     = "${var.project}"
  location   = "${var.region_type}"
  cluster    = "${google_container_cluster.default.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
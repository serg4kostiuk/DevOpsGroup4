#output "status_page_public_ip" {
  #value = google_compute_instance.default.1.network_interface.1.access_config.1.nat_ip
#}

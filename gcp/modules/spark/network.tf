resource "google_compute_subnetwork" "public_subnet" {
    name          =  "${format("%s","${var.project_name}-${var.env}-public-net")}"
    ip_cidr_range = "${var.public_subnet}"
    network       = "${var.network_self_link}"
    region        = "${var.region}"
}
# resource "google_compute_subnetwork" "private_subnet" {
#     name          =  "${format("%s","${var.project_name}-${var.env}-private-net")}"
#     ip_cidr_range = "${var.private_subnet}"
#     network      = "${var.network_self_link}"
#     region        = "${var.region}"
# }
resource "google_compute_network" "vpc" {
    name = "${format("%s","${var.project_name}-${var.env}-vpc")}"
    auto_create_subnetworks = "false"
    routing_mode  = "GLOBAL"
}

resource "google_compute_firewall" "allow-internal" {
    name    = "${var.project_name}-fw-allow-internal"
    network = "${google_compute_network.vpc.name}"
    allow {
        protocol = "icmp"
    }
    allow {
        protocol = "tcp"
        ports    = ["0-65535"]
    }
    allow {
        protocol = "udp"
        ports    = ["0-65535"]
    }
    source_ranges = [
        "${var.public_subnet}",
        "${var.private_subnet}"
    ]
}
resource "google_compute_firewall" "allow-http" {
    name = "${var.project_name}-fw-allow-http"
    network = "${google_compute_network.vpc.name}"
    allow {
        protocol = "tcp"
        ports = ["8080"]
    }
    # target_tags = ["master"] 
}

resource "google_compute_firewall" "allow-bastion" {
    name = "${var.project_name}-fw-allow-bastion"
    network = "${google_compute_network.vpc.name}"
    allow {
        protocol = "tcp"
        ports    = ["22"]
    }
    # target_tags = ["master"]
}


output "out_vpc_self_link" {
  value = "${google_compute_network.vpc.name}"
}
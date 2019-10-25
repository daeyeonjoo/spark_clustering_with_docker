provider "google" {
  credentials = "${file("spark-cluster1-427917c2cef5.json")}"
  project     = "spark-cluster1-256809"
  region      = "asia-east2"
}

resource "google_compute_network" "vpc_network" {
  name = "cluster-network"
  subnetworks_self_links = [
      "cluster-network-subnet"
  ]
}

resource "google_compute_subnetwork" "cluster-network-subnet" {
  name   = "default-us-east1"
  region = "asia-east2-a"
  ip_cidr_range = "192.168.0.0/16"
  gateway_address = "192.168.0.1"
}

resource "google_sql_database_instance" "master" {
    name = "master"
    region = "asia-east2-a"
    database_version = "POSTGRES_11"
    settings {
        tier = "db-g1-small"
    }
}

resource "google_compute_instance" "master" {
    name = "master"
    zone = "asia-east2-a"
    machine_type = "n1-standard-4"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-1804-lts"
        }
    }

    // Local SSD disk
    scratch_disk {
    }

    network_interface {
        network = "cluster-network"

        access_config {
            nat_ip = "192.168.0.10"
        }
    }

    metadata = {
        name = "master"
        type = "master"
    }
}

resource "google_compute_instance" "slave" {
    count = "1"
    name = "slave-${count.index}"
    zone = "asia-east2-a"
    machine_type = "n1-standard-4"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-1804-lts"
        }
    }

    // Local SSD disk
    scratch_disk {
    }

    network_interface {
        network = "cluster-network"

        access_config {
            nat_ip = "192.168.0.10"
        }
    }

    metadata = {
        type = "slave"
        index = "${count.index}"
    }
}
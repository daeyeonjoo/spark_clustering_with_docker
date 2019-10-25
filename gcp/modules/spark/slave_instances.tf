resource "google_compute_instance" "slave" {
    count = "${var.slave_count}"
    name = "slave-${count.index}"
    zone = "${format("%s", "${var.region}-b")}"
    machine_type = "${var.slave_instance_type}"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-1804-lts"
        }
    }

    scratch_disk {

    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.public_subnet.name}"
    }

    metadata = {
        type = "spark"
        role = "slave"
        index = "${count.index}"
    }
}
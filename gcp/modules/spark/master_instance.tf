resource "google_compute_instance" "master" {
    name = "master"
    zone = "${format("%s","${var.region}-b")}"
    machine_type = "n1-standard-4"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-1804-lts"
        }
    }

    scratch_disk {
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.public_subnet.name}"
        access_config {
            // Ephemeral IP
        }
  }

    metadata_startup_script = <<SCRIPT
        wget http://apache.mirror.cdnetworks.com/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
        tar -xzf spark-2.4.4-bin-hadoop2.7.tgz
        mv spark-2.4.4-bin-hadoop2.7 ~/spark
        rm spark-2.4.4-bin-hadoop2.7.tgz
    SCRIPT

    metadata = {
        type = "spark"
        role = "master"
        ssh_keys = "daeyeonjoo:${file(var.ssh_public_key_file)}"
    }

    provisioner "remote-exec" {
        connection {
            host = "${self.network_interface.0.access_config.0.nat_ip}"
            type        = "ssh"
            user        = "daeyeonjoo"
            timeout     = "30s"
            private_key = "${file("/Users/daeyeonjoo/.ssh/gce_ssh")}"
        }

        inline = [
        ]
    }
}
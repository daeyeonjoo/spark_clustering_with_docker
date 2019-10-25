provider "google" {
  credentials = "${file("spark-cluster1-427917c2cef5.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "global" {
    source = "./modules/global"
    region = "${var.region}"
    env = "${var.env}"
    project_name = "${var.project_name}"
    public_subnet = "${var.spark_cluster_public_subnet}"
    private_subnet = "${var.spark_cluster_private_subnet}"
}

module "spark" {
    source = "./modules/spark"
    region = "${var.region}"
    env = "${var.env}"
    project_name = "${var.project_name}"
    slave_count = "${var.slave_count}"
    master_instance_type = "${var.master_instance_type}"
    slave_instance_type = "${var.slave_instance_type}"
    network_self_link = "${module.global.out_vpc_self_link}"
    public_subnet = "${var.spark_cluster_public_subnet}"
    private_subnet = "${var.spark_cluster_private_subnet}"
    ssh_public_key_file = "${var.ssh_pub_key_file}"
}
variable "region" {
    default = "asia-east2"
}

variable "project" {
    default = "spark-cluster1-256809"
}

variable "project_name" {
    default = "spark-cluster"
}

variable "env" {
    default = "dev"
}

variable "spark_cluster_private_subnet" {
    default = "10.26.1.0/24"
}
variable "spark_cluster_public_subnet" {
    default = "10.26.2.0/24"
}

variable "slave_count" {
    default = 2
}

variable "master_instance_type" {
    default = "n1-standard-4"
}

variable "slave_instance_type" {
    default = "n1-standard-2"
}

variable "name" {
  default = "value"
}

variable "ssh_pub_key_file" {
  default = "/Users/daeyeonjoo/.ssh/gce_ssh.pub"
}

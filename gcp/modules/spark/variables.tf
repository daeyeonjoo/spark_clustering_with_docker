variable "region" {
  type = "string"
}

variable "env" {
  type = "string"
}

variable "project_name" {
    type = "string"
}

variable "master_instance_type" {
  default = "value"
}

variable "slave_instance_type" {
  default = "value"
}

variable "slave_count" {
  type = "string"
  default = "1"
}

variable "name" {
  default = "value"
}

variable "network_self_link" {
  type = "string"
}

variable "public_subnet" {
    type = "string"
}

variable "private_subnet" {
    type = "string"
}

variable "ssh_public_key_file" {
  type = "string"
}

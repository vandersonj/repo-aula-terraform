terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_kubernetes_cluster" "foo" {
  name    = "${var.name}.${terraform.workspace}"
  region  = var.region
  version = var.k8s_version

  node_pool {
    name       = "worker-pool"
    size       = var.k8s_node_size
    node_count = var.k8s_node_count

  }
  lifecycle {
    prevent_destroy = false
  }
}



# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}

variable "name" {
  type    = string
  default = "k8s-aula"
}

variable "region" {
  type    = string
  default = "nyc1"
}

variable "k8s_version" {
  type    = string
  default = "1.27.3-do.0"

}

variable "k8s_node_size" {
  type    = string
  default = "s-2vcpu-4gb"

}

variable "k8s_node_count" {
  type    = number
  default = 2
}
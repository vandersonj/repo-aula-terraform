terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


variable "do_token" {}


provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "vm-web"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  lifecycle {
  #   # create_before_destroy = true
  #   # prevent_destroy = true
  #   ignore_changes = [ tags, ]
  #   replace_triggered_by = [ digitalocean_droplet.Jenkins.name ]
    precondition {
      condition = var.region == "nyc1" || var.region == "nyc3"
      error_message = "A Região precisa ser 'nyc1' or 'nyc3'."
    }
  }
}

resource "digitalocean_droplet" "Jenkins" {
  image  = "ubuntu-22-04-x64"
  name   = "vm-jenkins"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}

variable "region" {
  type    = string
  default = "nyc1"
}
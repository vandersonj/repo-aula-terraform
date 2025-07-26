terraform {
  required_version = "~>1.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "ssh_key" {
  name = "terraform-exec"
}

resource "digitalocean_droplet" "vm_aula" {
  image    = "ubuntu-22-04-x64"
  name     = "maquina-aula"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/terraform-exec")
    host        = digitalocean_droplet.vm_aula.ipv4_address
  }
  provisioner "file" {
    source   = "arquivoinstall.sh"
    destination = "/root/arquivoinstall.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /root/arquivoinstall.sh",
      "/root/arquivoinstall.sh"
    ]
  }
}

variable "do_token" {}


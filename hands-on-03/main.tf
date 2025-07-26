terraform {
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

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-20-04-x64"
  name     = "vms-lab-${count.index}"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  count    = 2
  ssh_keys = [digitalocean_ssh_key.ssh-key.fingerprint]
}

# Create a new SSH key
resource "digitalocean_ssh_key" "ssh-key" {
  name       = "terraform-exec"
  public_key = file("/home/vanderson/.ssh/terraform-exec.pub")
}
output "ip" {
  value = digitalocean_droplet.web[*].ipv4_address
}
variable "do_token" {}
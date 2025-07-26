data "digitalocean_ssh_key" "ssh-key" {
  name = var.droplet_key
}
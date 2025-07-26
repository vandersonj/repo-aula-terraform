variable "do_token" {
  type        = string
  description = "chave de acesso"
}

variable "droplet_name" {
  default     = "vm-aula-terraform"
  type        = string
  description = "Nome inicial das VMs"
}

variable "droplet_region" {
  default     = "nyc1"
  type        = string
  description = "Região da Infraestrutura"
}

variable "droplet_size" {
  default     = "s-1vcpu-2gb"
  type        = string
  description = "tipo da VM"
}

variable "droplet_key" {
  default     = "aula-terraform"
  type        = string
  description = "chave SSH para conexão remota"
}

variable "vms_count" {
  default     = 1
  type        = number
  description = "Quantidade da VM"
}
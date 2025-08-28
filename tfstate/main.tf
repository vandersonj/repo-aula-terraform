# persistencia do estado do terraform Local
# terraform {
#   backend "local" {
#     path = "./estado-do-projeto.tfstate"
#   }
# }

# persistencia do estado do terraform Postgres
# terraform {
#   backend "pg" {
#     conn_str = "postgresql://postgres:minhasenha123@localhost:5432/meu_banco_de_dados?sslmode=disable"
#   }
# }

#persistencia do estado do terraform kubernetes
#chamada -> terraform init -backend-config="secret_suffix=estado config_path=~/.kube/config"
# Ou utilizar variaveis de ambiente -> export KUBE_CONFIG_PATH="~/.kube/config"  
terraform {
  backend "kubernetes" {
    # secret_suffix    = "state"
    # config_path      = "~/.kube/config"
  }
}

resource "local_file" "arquivo_local" {
  filename = "arquivo.txt"
  content  = "Conteúdo Novo do arquivo"
}
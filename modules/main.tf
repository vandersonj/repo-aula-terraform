module "pets" {
  source = "./modules/pets"
  # prefixo_arquivo = "teste-arquivo-${count.index}"
  # count           = 4
  prefixo_arquivo = "teste-arquivo-${each.key}"
  for_each        = toset(["pre01", "pre02", "pre03", "pre04"])
}


# module "pets01" {
#   source          = "./modules/pets"
#   prefixo_arquivo = "teste-arquivo-1"

#    depends_on = [
#      module.pets02
#    ]
# }

# module "pets02" {
#   source          = "./modules/pets"
#   prefixo_arquivo = "teste-arquivo-2"
# }
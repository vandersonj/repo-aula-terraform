# Comandos Básicos do Terraform

Abaixo estão alguns dos principais comandos do Terraform e suas funções:

## 1. `terraform init`
Inicializa um diretório de trabalho contendo arquivos de configuração do Terraform. Baixa os plugins necessários.

## 2. `terraform plan`
Mostra as ações que o Terraform irá executar para alcançar o estado desejado da infraestrutura, sem aplicar mudanças.

## 3. `terraform apply`
Aplica as mudanças necessárias para alcançar o estado desejado da infraestrutura, conforme definido nos arquivos de configuração.

## 4. `terraform destroy`
Remove todos os recursos gerenciados pelo Terraform definidos na configuração.

## 5. `terraform validate`
Verifica se os arquivos de configuração estão sintaticamente corretos.

## 6. `terraform fmt`
Formata automaticamente os arquivos de configuração para o padrão oficial do Terraform.

## 7. `terraform output`
Exibe os valores de saída definidos na configuração após a aplicação.

## 8. `terraform show`
Exibe o estado atual ou um plano de execução em formato legível.

## 9. `terraform state`
Gerencia o arquivo de estado do Terraform, permitindo operações como listar, mover ou remover recursos do estado.

## 10. `terraform import`
Importa recursos existentes fora do Terraform para o controle do Terraform.


### Comandos de Estado do Terraform

- `terraform state list`  
  Lista todos os recursos presentes no arquivo de estado.

- `terraform state show <recurso>`  
  Mostra detalhes de um recurso específico no arquivo de estado.

- `terraform state rm <recurso>`  
  Remove um recurso do arquivo de estado sem destruí-lo na infraestrutura.

- `terraform state mv <origem> <destino>`  
  Move ou renomeia um recurso dentro do arquivo de estado.

- `terraform state pull`  
  Baixa o arquivo de estado remoto para visualização local.

- `terraform state push`  
  Envia um arquivo de estado local para o backend remoto.

## 10. `terraform import`
Importa recursos existentes fora do Terraform para o controle do Terraform.
provider "aws" {
  region = "us-east-2"
}

module "function" {
  # Garde la source inchangée si elle pointe vers ton module local
  source = "../../modules/lambda-sample" 

  # CHANGEMENT ICI : On utilise la variable au lieu de "lambda-sample"
  name = var.name          

  src_dir = "${path.module}/src" 
  runtime = "nodejs20.x"          
  handler = "index.handler"       
  # ... reste des paramètres ...
}
module "gateway" {
  # Ce lien pointe vers le dépôt brikis98, puis descend dans le dossier ch3
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/api-gateway"

  name               = var.name
  function_arn       = module.function.function_arn
  api_gateway_routes = ["GET /"]
}

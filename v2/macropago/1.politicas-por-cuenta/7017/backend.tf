terraform {
  backend "s3" {
    key          = "1.politicas-por-cuenta/7017/7017.tfstate"
    bucket       = "terraform-servicios-centralizados"
    region       = "us-east-1"
    use_lockfile = true
  }
  required_version = ">= 1.10"
}
terraform {
  backend "s3" {
    key          = "2.asignacion-role/asignacion-role.tfstate"
    bucket       = "terraform-servicios-centralizados"
    region       = "us-east-1"
    use_lockfile = true
  }
  required_version = ">= 1.10"
}
variable "env" {
  type = string
  description = "The environment name"
  default = "dev"
}

resource "null_resource" "env" {
  triggers = {
    env = var.env
  }
}

output "env" {
  value = var.env
}

variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "owner" {
  type        = string
  description = ""
  default     = "455462641947"
}

variable "project_name" {
  type        = string
  description = ""
  default     = "kxc-desafio-tecnico"
}

variable "domain_name" {
  type        = string
  description = ""
  default     = "nicolasmatos.dev.br"
}

variable "terraform" {
  type        = bool
  description = ""
  default     = true
}

variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}

variable "namespace" {
  type        = string
  default     = "argocd"
}

variable "node_port" {
  type    = number
  default = 30080
}

variable "chart_version" {
  type    = string
  default = "4.10.8"
}
variable "app_name" {
  type    = string
  default = "helming2048"
}

variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "app_namespace" {
  type    = string
  default = "myapp"
}

variable "repo_url" {
  type    = string
  default = "https://github.com/OmerKH/Helming2048"
}

variable "revision" {
  type    = string
  default = "HEAD"
}

variable "chart_path" {
  type    = string
  default = "gamechart"
}

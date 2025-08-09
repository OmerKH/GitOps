variable "kubeconfig" {
  type        = string
  default     = "~/.kube/config"
  description = "Path to kubeconfig file"
}


variable "environment" {
  default = "dev"
}
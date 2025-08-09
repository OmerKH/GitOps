# module "k8s" {
#   source     = "./modules/k8s"
#   kubeconfig = var.kubeconfig
# }

module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = "4.10.8"
  node_port     = 30080
}

module "argocd_app" {
  source            = "./modules/apps"
  app_name          = "helming2048"
  argocd_namespace  = "argocd"
  app_namespace     = "myapp"
  repo_url          = "https://github.com/OmerKH/Helming2048"
  revision          = "HEAD"
  chart_path        = "gamechart"
}

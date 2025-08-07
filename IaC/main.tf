module "k8s" {
  source     = "./modules/k8s"
  kubeconfig = var.kubeconfig
}

module "argocd" {
  source             = "./modules/argocd"
  nodeport           = 30080
  helm_chart_version = "5.46.8"
}

module "argocd_app" {
  source         = "./modules/apps"
  app_name       = "devops2048"
  namespace      = "argocd"
  repo_url       = "https://github.com/OmerKH/Helming2048"
  path           = "gamechart"
  revision       = "HEAD"
  app_namespace  = "default"
}
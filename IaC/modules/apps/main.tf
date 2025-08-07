resource "kubernetes_namespace" "myapp" {
  metadata {
    name = var.app_namespace
  }
}

resource "kubernetes_manifest" "argocd_app" {
    depends_on = [kubernetes_namespace.myapp]

  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name = var.app_name #"helming2048"
      namespace = var.argocd_namespace #"argocd"
    }
    spec = {
        project = "default"
        source = {
            repoURL = var.repo_url #"https://github.com/OmerKH/Helming2048"
            targetRevision = var.revision #"HEAD"
            path = var.chart_path #"gamechart"
            helm = {
                # Let ArgoCD use the values.yaml file from the repository
                # values = ""
            }
        }
        destination = {
            server = "https://kubernetes.default.svc"
            namespace = var.app_namespace #"myapp"
        }
        syncPolicy = {
            automated = {
                prune = true
                selfHeal = true
            }
            syncOptions = [
                "CreateNamespace=true"
            ]
        }
    }
  }
}

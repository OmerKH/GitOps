resource "kubernetes_manifest" "argocd_app_2048" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name = "Helming2048"
      namespace = "argocd"
    }
    spec = {
        project = "default"
        source = {
            repoURL = "https://github.com/OmerKH/Helming2048"
            targetRevision = "main"
            path = "gamechart"
            helm = {
                values = []
            }
        }
        destination = {
            server = "https://kubernetes.default.svc"
            namespace = "default"
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
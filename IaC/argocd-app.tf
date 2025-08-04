resource "kubernetes_manifest" "argocd_app_2048" {
  depends_on = [helm_release.argocd, kubernetes_namespace.myapp]
  
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name = "helming2048"
      namespace = "argocd"
    }
    spec = {
        project = "default"
        source = {
            repoURL = "https://github.com/OmerKH/Helming2048"
            targetRevision = "HEAD"
            path = "gamechart"
            helm = {
                # Let ArgoCD use the values.yaml file from the repository
                # values = ""
            }
        }
        destination = {
            server = "https://kubernetes.default.svc"
            namespace = "myapp"
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

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
  }
}


resource "helm_release" "argocd" {
    name       = "argocd"
    namespace  = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"
    version    = var.chart_version #"4.10.8"

    create_namespace = false  

    values = [
        yamlencode({
            server: {
                service: {
                    type: "NodePort"
                    node_port: var.node_port #30080
                }
            }
        })
        ]
        depends_on = [kubernetes_namespace.argocd]
}
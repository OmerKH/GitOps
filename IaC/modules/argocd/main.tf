resource "helm_release" "argocd" {
    name       = "argocd"
    namespace  = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"
    version    = var.helm_chart_version #"4.10.8"
    create_namespace = true

    create_namespace = false  

    values = [
        yamlencode({
            server: {
                service: {
                    type: "NodePort"
                    node_port: var.nodeport #30080
                }
            }
        })
        ]
}
resource "helm_release" "argocd" {
    name       = "argocd"
    namespace  = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"
    version    = "4.10.8"

    create_namespace = true

    values = [
        yamlencode({
            server: {
                service: {
                    type: "NodePort"
                    node_port: 30080
                }
            }
        })
        ]

    # values = [
    #     file("${path.module}/../gamechart/values.yaml")
    # ]
}
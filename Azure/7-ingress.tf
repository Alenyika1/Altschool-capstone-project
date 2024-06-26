data "azurerm_kubernetes_cluster" "eks" {
  name                = "${local.env}-${local.eks_name}"
  resource_group_name = azurerm_resource_group.capstone.name

  # Comment this out if you get: Error: Kubernetes cluster unreachable 
  depends_on = [azurerm_kubernetes_cluster.eks]
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.eks.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.eks.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.eks.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.eks.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "external_nginx" {
  name = "external"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  create_namespace = true
  version          = "4.8.0"
}
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  values = [file("${path.module}/ingress/ingress.yaml")]
}

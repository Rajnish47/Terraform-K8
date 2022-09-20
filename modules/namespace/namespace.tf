resource "kubernetes_namespace" "namespace" {
  metadata {
    # labels = {
    #   env = var.environment
    # }
    name = var.namespace_name
  }
}
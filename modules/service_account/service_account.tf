resource "kubernetes_service_account" "service_account" {
  metadata {
    name = var.service_account_name
    namespace = var.service_account_namespace
  }
}
resource "kubernetes_secret" "secret" {
  metadata {
    name = var.secret_name
    namespace = var.secret_namespace
  }

  data = var.secret_data

  type = var.secret_type
}
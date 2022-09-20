resource "kubernetes_service" "example" {
  metadata {
    name = var.service_name
    namespace = var.service_namespace
  }
  spec {
    selector = var.match_labels
    # session_affinity = "ClientIP"
    port {
      port        = var.service_port
      target_port = var.service_target_port
    }

    type = var.service_type
  }
}
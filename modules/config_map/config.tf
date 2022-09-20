resource "kubernetes_config_map" "config_map" {
  metadata {
    name = var.config_map_name
    namespace = var.config_map_namespace
    labels = var.config_map_labels
  }

  data = var.config_map_data  
}
resource "kubernetes_role" "role" {
  metadata {
    name = var.role_name
    labels = var.role_labels
  }

  rule {
    api_groups     = var.role_api_groups
    resources      = var.role_resources
    resource_names = var.role_resource_names
    verbs          = var.role_verbs
  }
}
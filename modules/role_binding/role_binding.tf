resource "kubernetes_role_binding" "role_binding" {
  metadata {
    name      = var.role_binding_name
    namespace = var.role_binding_namespace
  }
  role_ref {
    api_group = var.role_binding_ref_api_group
    kind      = var.role_binding_ref_kind
    name      = var.role_binding_ref_name
  }
  subject {
    kind      = var.role_binding_sub_kind
    name      = var.role_binding_sub_name
    # api_group = var.role_binding_sub_api_group
  }
}
namespace_names = [ "production" ]

secret_parameters = [ {
  secret_data = {POSTGRES_USERNAME:"admin123",POSTGRES_PASSWORD:"admin123"}
  secret_name = "postgre-details"
  secret_namespace = "production"
  secret_type = "Opaque"
} ]

config_map_parameters = [ {
  config_map_data = {username = "Rajnish", password = "rj47"}
  config_map_labels = {type = "database", tier = "backend" }
  config_map_name = "postgre-details"
  config_map_namespace = "production"
} ]

service_account_parameters = [ {
  service_account_name = "appmanagement"
  service_account_namespace = "production"
} ]

role_parameters = [ {
  role_api_groups = [""]
  role_name = "service-account-role"
  role_namespace = "production"
  role_labels = { type= "role", tier = "service-account" }
  role_resource_names = [""]
  role_resources = ["pods","services"]
  role_verbs = ["create","get","delete"]
} ]

role_binding_parameters = [ {
  role_binding_name = "service-account-rb"
  role_binding_namespace = "production"
  role_binding_ref_api_group = "rbac.authorization.k8s.io"
  role_binding_ref_kind = "Role"
  role_binding_ref_name = "service-account-role"
  # role_binding_sub_api_group = "rbac.authorization.k8s.io"
  role_binding_sub_kind = "ServiceAccount"
  role_binding_sub_name = "appmanagement"
} ]

deployment_parameters = [ {
    deployment_name = "trial"
    image_name = "nginx"
    pod_name = "nginx"
    deployment_namespace = "production"
    deployment_replica_name = "trial"
    deployment_replicas = 1
    deployment_labels = {app = "trial", tier = "backend" }
    match_labels = {name = "trial", app = "backend"}
  } ]

service_parameters = [ {
  service_name = "node-service"
  service_port = 5000
  service_target_port = 5000
  service_type = "NodePort"
  service_namespace = "production"
  match_labels = {name = "trial", app = "backend"}
}]


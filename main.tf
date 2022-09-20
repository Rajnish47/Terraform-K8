module "namespaces"{
    source = "./modules/namespace/"
    count = length(var.namespace_names)
    namespace_name= "${var.namespace_names[count.index]}"     
}

module "secrets" {
    source = "./modules/secret/"
    count = length(var.secret_parameters)
    secret_name = var.secret_parameters[count.index].secret_name
    secret_namespace = var.secret_parameters[count.index].secret_namespace
    secret_data = var.secret_parameters[count.index].secret_data
    secret_type = var.secret_parameters[count.index].secret_type
    
}

module "service_accounts" {
    source = "./modules/service_account/"
    count = length(var.service_account_parameters)
    service_account_name = var.service_account_parameters[count.index].service_account_name
    service_account_namespace = var.service_account_parameters[count.index].service_account_namespace
    
}

module "roles" {
    source = "./modules/role/"
    count = length(var.role_parameters)
    role_name = var.role_parameters[count.index].role_name
    role_namespace = var.role_parameters[count.index].role_namespace
    role_labels = var.role_parameters[count.index].role_labels
    role_api_groups = var.role_parameters[count.index].role_api_groups
    role_resources = var.role_parameters[count.index].role_resources
    role_resource_names = var.role_parameters[count.index].role_resource_names
    role_verbs = var.role_parameters[count.index].role_verbs    
}

module "role_bindings" {
    source = "./modules/role_binding/"
    count = length(var.role_binding_parameters)
    role_binding_name = var.role_binding_parameters[count.index].role_binding_name
    role_binding_namespace = var.role_binding_parameters[count.index].role_binding_namespace
    role_binding_ref_api_group = var.role_binding_parameters[count.index].role_binding_ref_api_group
    role_binding_ref_kind = var.role_binding_parameters[count.index].role_binding_ref_kind
    role_binding_ref_name = var.role_binding_parameters[count.index].role_binding_ref_name
    # role_binding_sub_api_group = var.role_binding_parameters[count.index].role_binding_sub_api_group
    role_binding_sub_kind = var.role_binding_parameters[count.index].role_binding_sub_kind
    role_binding_sub_name = var.role_binding_parameters[count.index].role_binding_sub_name
}

module "config_maps" {
    source = "./modules/config_map/"
    count = length(var.config_map_parameters)
    config_map_name = var.config_map_parameters[count.index].config_map_name
    config_map_namespace = var.config_map_parameters[count.index].config_map_namespace
    config_map_labels = var.config_map_parameters[count.index].config_map_labels
    config_map_data = var.config_map_parameters[count.index].config_map_data
}

module "deployments"{
    source = "./modules/deployment/"
    count = length(var.deployment_parameters)
    deployment_name = "${var.deployment_parameters[count.index].deployment_name}"
    deployment_namespace = "${var.deployment_parameters[count.index].deployment_namespace}"
    deployment_replica_name= "${var.deployment_parameters[count.index].deployment_replica_name}"
    deployment_replicas = var.deployment_parameters[count.index].deployment_replicas
    pod_name = var.deployment_parameters[count.index].pod_name
    image_name = var.deployment_parameters[count.index].image_name
    deployment_labels = var.deployment_parameters[count.index].deployment_labels
    match_labels = var.deployment_parameters[count.index].match_labels
}

module "services"{
    depends_on = [
      module.deployments
    ]
    source = "./modules/service/"
    count=length(var.service_parameters)
    service_name = "${var.service_parameters[count.index].service_name}"
    service_port = var.service_parameters[count.index].service_port
    service_target_port= var.service_parameters[count.index].service_target_port
    service_type = "${var.service_parameters[count.index].service_type}"
    service_namespace = "${var.service_parameters[count.index].service_namespace}"
    match_labels = var.service_parameters[count.index].match_labels
}
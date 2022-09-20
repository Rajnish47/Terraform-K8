variable "namespace_names" {
  type    = list(string)
  default = ["Development"]
}

variable "secret_parameters" {
  type = list(object({
    secret_name = string
    secret_namespace = string
    secret_data = any
    secret_type = string
  }))  
}

variable "service_account_parameters" {
  type = list(object({
    service_account_name = string
    service_account_namespace = string
  }))
}

variable "config_map_parameters"{
  type = list(object({
    config_map_name = string
    config_map_namespace = string
    config_map_labels = any
    config_map_data = any
  }))
}

variable "role_parameters" {
  type = list(object({
    role_name = string
    role_namespace = string
    role_labels = any
    role_api_groups = list(string)
    role_resources = list(string)
    role_resource_names = list(string)
    role_verbs = list(string)
  }))  
}

variable "role_binding_parameters" {
  type = list(object({
    role_binding_name = string
    role_binding_namespace = string
    role_binding_ref_api_group = string
    role_binding_ref_name = string
    role_binding_ref_kind = string
    
    role_binding_sub_name = string
    role_binding_sub_kind = string
  }))
  
}
#add extra role_binding_sub_api_group = string

variable "service_parameters" {
  type = list(object({
    service_name= string
    service_port = number
    service_target_port = number
    service_type = string
    service_namespace = string
    match_labels =any
  }))
  
}

variable "deployment_parameters" {
  type = list(object({
    deployment_name= string
    deployment_replicas = number
    deployment_replica_name = string
    deployment_namespace = string
    deployment_labels = any
    match_labels = any
    image_name = string
    pod_name = string
  }))  
}

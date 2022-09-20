variable "role_binding_name" {
    type = string  
}

variable "role_binding_namespace" {
    type = string
    default = "default"  
}

variable "role_binding_ref_api_group" {
    type = string  
}

variable "role_binding_ref_kind" {
    type = string  
}

variable "role_binding_ref_name" {
    type = string  
}

variable "role_binding_sub_kind" {
    type = string  
}

# variable "role_binding_sub_api_group" {
#     type = string  
# }

variable "role_binding_sub_name" {
    type = string  
}
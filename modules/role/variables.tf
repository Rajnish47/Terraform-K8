variable "role_name" {
    type = string  
}

variable "role_namespace" {
     type = string
     default = "default"
}

variable "role_labels" {
    type = any  
}

variable "role_api_groups" {
  type = list(string)
  default = [""]
}

variable "role_resources" {
    type = list(string)
    default = [""]  
}

variable "role_resource_names"{
    type = list(string)
    default = [""]
}

variable "role_verbs" {
    type = list(string)
    default = [""]  
}
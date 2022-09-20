variable "config_map_name" {
    type = string  
}

variable "config_map_namespace" {
    type = string
    default = "default"  
}

variable "config_map_labels" {
    type = any  
}

variable "config_map_data" {
    type = any  
}
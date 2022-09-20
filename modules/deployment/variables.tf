variable "deployment_name" {  
}

variable "deployment_replicas" {
}

variable "deployment_replica_name" { 
}

variable "image_name" {  
}

variable "pod_name" {  
}

variable "deployment_namespace" {  
}

variable "deployment_labels" {
  type = any
}

variable "match_labels" {
  type = any  
}

variable "cspecs" {
  type = any
  default = [{name = "naginx", image = "nginx"},{name = "redis", image = "redis"}]  
}
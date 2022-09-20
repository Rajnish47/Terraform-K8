resource "kubernetes_deployment" "example" {
  metadata {
    name = var.deployment_name
    namespace = var.deployment_namespace
    labels = var.deployment_labels
  }

  spec {
    replicas = var.deployment_replicas

    selector {
      match_labels = var.match_labels
    }

    template {
      metadata {
        name = var.deployment_replica_name  
        labels = var.match_labels
      }

      spec{
        
        container {
          name = var.pod_name
          image = var.image_name         
        }

        # container {
        #   name = "redis"
        #   image = "redis"          
        # }
      }
    }
  }
}
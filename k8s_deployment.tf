resource "kubernetes_deployment" "test_pdv_deployment" {
  metadata {
    name = "test-pdv-deployment"
    namespace = kubernetes_namespace.test_pdv.metadata.0.name
    labels = {
      app = "test-pdv"
    }
  }

  spec {
    replicas = 5
    selector {
      match_labels = {
        app = "test-pdv"
      }
    }

    template {
      metadata {
        labels = {
          app = "test-pdv"
        }
      }

      spec {
        container {
          image = "docker.io/chrisloarryn/testpdv:1.0.2" // Aquí pones la imagen de Docker Hub
          name  = "test-pdv-container"

          // Puedes configurar puertos, variables de entorno, volúmenes, etc., según sea necesario.
          port {
            container_port = 8080 // El puerto que expone tu aplicación
          }
        }
      }
    }
  }
}

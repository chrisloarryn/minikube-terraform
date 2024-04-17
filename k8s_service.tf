resource "kubernetes_service" "api" {
  metadata {
    annotations = {
      "kompose.cmd"      = "kompose convert -f docker-compose.yaml"
      "kompose.version"  = "1.27.0 (HEAD)"
    }
    labels = {
      "io.kompose.service" = "api"
    }
    name = "api"
    namespace = kubernetes_namespace.test_pdv.metadata.0.name
  }

  spec {
    port {
      name        = "3000"
      port        = 3000
      target_port = 3000
    }

    selector = {
      "io.kompose.service" = "api"
    }

    type = "NodePort"
  }
}

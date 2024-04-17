resource "kubernetes_persistent_volume_claim" "api_claim0" {
  metadata {
    labels = {
      "io.kompose.service" = "api-claim0"
    }
    name = "api-claim0"
    namespace = kubernetes_namespace.test_pdv.metadata.0.name
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "100Mi"
      }
    }
  }
}

resource "kubernetes_config_map" "coredns" {
  metadata {
    name      = "coredns"
    namespace = kubernetes_namespace.test_pdv.metadata.0.name
  }

  data = {
    "Corefile" = <<-EOT
      .:53 {
          errors
          health {
             lameduck 5s
          }
          ...
      }
      test:53 {
              errors
              cache 30
              forward . 192.168.49.2
      }
    EOT
  }
}

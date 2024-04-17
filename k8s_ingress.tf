resource "kubernetes_ingress" "api_ingress" {
  metadata {
    name      = "api-ingress"
    namespace = kubernetes_namespace.test_pdv.metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "api.minikube.local"
      http {
        path {
          path = "/"
          // path_type = "Prefix"
          backend {
            // service {
            service_name = kubernetes_service.api.metadata[0].name
            service_port  = 3000
          }
        }
      }
    }
  }
}

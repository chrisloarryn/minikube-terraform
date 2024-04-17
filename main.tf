resource "kubernetes_namespace" "test_pdv" {
    metadata {
        name = "test-pdv"
    }
}

# resource "null_resource" "port_forward_api" {
#   depends_on = [
#     kubernetes_service.api
#   ]

#   provisioner "local-exec" {
#     command = "minikube kubectl -- port-forward service/api -n test-pdv 8080:3000"
#   }
# }

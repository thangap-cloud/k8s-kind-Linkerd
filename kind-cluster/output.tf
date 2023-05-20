#provider "kubectl" {
#  host = "${kind_cluster.default.endpoint}"
#  cluster_ca_certificate = "${kind_cluster.default.cluster_ca_certificate}"
#  client_certificate = "${kind_cluster.default.client_certificate}"
#  client_key = "${kind_cluster.default.client_key}"
#}
#
#provider "helm" {
#  kubernetes {
#    host = "${kind_cluster.default.endpoint}"
#    cluster_ca_certificate = "${kind_cluster.default.cluster_ca_certificate}"
#    client_certificate = "${kind_cluster.default.client_certificate}"
#    client_key = "${kind_cluster.default.client_key}"
#  }
#}

output "host" {
  value = kind_cluster.default.endpoint
}

output "cluster_ca_certificate" {
  value = kind_cluster.default.cluster_ca_certificate
}

output "client_certificate" {
  value = kind_cluster.default.client_certificate
}

output "client_key" {
  value = kind_cluster.default.client_key
}


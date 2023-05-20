provider "kubectl" {
  host = data.terraform_remote_state.cluster.outputs.host
  cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
  client_certificate = data.terraform_remote_state.cluster.outputs.client_certificate
  client_key = data.terraform_remote_state.cluster.outputs.client_key
}

provider "helm" {
  kubernetes {
    host = data.terraform_remote_state.cluster.outputs.host
    cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
    client_certificate = data.terraform_remote_state.cluster.outputs.client_certificate
    client_key = data.terraform_remote_state.cluster.outputs.client_key
  }
}

provider "kubernetes" {
  host = data.terraform_remote_state.cluster.outputs.host
  cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
  client_certificate = data.terraform_remote_state.cluster.outputs.client_certificate
  client_key = data.terraform_remote_state.cluster.outputs.client_key
}

provider null {}
provider tls {}
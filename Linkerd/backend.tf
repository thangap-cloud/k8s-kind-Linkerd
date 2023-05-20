terraform {
  backend "local" {
    path = "../states/linkerd.tfstate"
  }
}
data "terraform_remote_state" "cluster" {
  backend = "local"
  config = {
    path = "../states/cluster.tfstate"
  }
}

data "terraform_remote_state" "cm" {
  backend = "local"
  config = {
    path = "../states/cert_manager.tfstate"
  }
}

data "terraform_remote_state" "cm_crds" {
  backend = "local"
  config = {
    path = "../states/cm_crds.tfstate"
  }
}
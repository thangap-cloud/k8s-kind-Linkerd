terraform {
  backend "local" {
    path = "../states/cm_crds.tfstate"
  }
}
data "terraform_remote_state" "cluster" {
  backend = "local"

  config = {
    path = "../states/cluster.tfstate"
  }
}
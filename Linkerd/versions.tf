terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.0.12"
    }

    kubernetes  = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0"
    }

    helm        = {
      source    = "hashicorp/helm"
      version   = "~> 2.2.0"
    }

    tls         = {
      source    = "hashicorp/tls"
      version   = "~> 3.4.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

  }

  required_version = ">= 1"
}

provider "kind" {}
resource "tls_private_key" "root" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "tls_self_signed_cert" "root" {
  key_algorithm   = tls_private_key.root.algorithm
  private_key_pem = tls_private_key.root.private_key_pem

  validity_period_hours = 87600
  early_renewal_hours   = 2190

  is_ca_certificate = true

  allowed_uses = [
    "cert_signing",
    "key_encipherment",
  ]

  subject {
    common_name = "identity.linkerd.cluster.local"
  }
}

resource "kubernetes_manifest" "issuer" {
  manifest = yamldecode(file("l5d_issuer.yaml"))
}

resource "kubernetes_manifest" "certificate" {
  manifest = yamldecode(file("l5d_id_cert.yaml"))
}

resource "kubernetes_namespace" "linkerd" {
  metadata {
    name = "linkerd"
    annotations = {
      "linkerd.io/inject" = "disabled"
    }
    labels = {
      "config.linkerd.io/admission-webhooks" = "disabled"
    }
  }
}

resource "kubernetes_secret" "linkerd" {
  metadata {
    name      = "linkerd-trust-anchor"
    namespace = kubernetes_namespace.linkerd.metadata[0].name
  }
  data = {
    "tls.crt" = tls_self_signed_cert.root.cert_pem
    "tls.key" = tls_private_key.root.private_key_pem
  }
  type = "kubernetes.io/tls"
}
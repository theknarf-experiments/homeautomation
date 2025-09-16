terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "/etc/rancher/k3s/k3s.yaml"
}

resource "kubernetes_deployment" "litellm" {
  metadata {
    name = "litellm-proxy"
    labels = {
      app = "litellm"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "litellm"
      }
    }

    template {
      metadata {
        labels = {
          app = "litellm"
        }
      }

      spec {
        container {
          image = "ghcr.io/berriai/litellm:main-stable"
          name  = "litellm"

          port {
            container_port = 4000
          }

          env {
            name  = "VERTEX_PROJECT"
            value = "your-project-id"
          }
          env {
            name  = "VERTEX_LOCATION"
            value = "us-central1"
          }
          env {
            name  = "GOOGLE_API_KEY"
            value = "your-api-key"
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "litellm" {
  metadata {
    name = "litellm-service"
  }

  spec {
    selector = {
      app = "litellm"
    }

    port {
      port        = 4000
      target_port = 4000
    }

    type = "LoadBalancer"
  }
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "webserver1"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_container" "nginx2" {
  image = docker_image.nginx.image_id
  name  = "webserver2"
  ports {
    internal = 80
    external = 8001
  }
}

resource "docker_container" "nginx3" {
  image = docker_image.nginx.image_id
  name  = "webserver3"
  ports {
    internal = 80
    external = 8002
  }
}
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "homeworknet" {
  name   = "homeworknet"
  driver = "bridge"
}

resource "docker_image" "httpecho" {
  name         = "hashicorp/http-echo:${var.http-echo_docker_tag}"
  keep_locally = false
}

resource "docker_image" "nginx" {
  name = "nginx:${var.nginx_docker_tag}"
  keep_locally = false
}


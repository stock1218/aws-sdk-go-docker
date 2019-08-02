# aws-sdk-go-docker
A light-weight, distroless container template for deploying Go servers with the AWS Go SDK. It focuses on security, usability, and simplicity.

## Cool, but what does it do?
This Dockerfile uses a multi-stage build that starts with the [golang](https://hub.docker.com/_/golang) [alpine](https://alpinelinux.org/) base. It will then copy the project, install [dep](https://github.com/golang/dep), satisfy all the project's dependencies, and build the application. It then merges the previous layers to use a [distroless](https://github.com/GoogleContainerTools/distroless) layer and runs the application.

## How do I use it?
At the moment, the most important file is the Dockerfile. The Gopkg files are used by dep to install dependencies and the main.go file contains your application's entry point. To get started, make sure your project is using dep and you have a program entry point. Then all you need to do is copy the docker file into your project's root and execute `docker build -t app .; docker run app` inside your project's root.

## How big is it?
27.3MB 😲
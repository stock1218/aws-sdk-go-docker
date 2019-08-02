# aws-sdk-go-docker
A light-weight, distroless container for deploying Go servers with the AWS Go SDK. It focuses on security, usability, and simplicity.

## Cool, but what does it do?
This Dockerfile uses a multi-stage build that starts with the [golang](https://hub.docker.com/_/golang) [alpine](https://alpinelinux.org/) base. It will then copy the project, install [dep](https://github.com/golang/dep), satisfy all the project's dependencies, and build the application. It then merges the previous layers to use a [distroless](https://github.com/GoogleContainerTools/distroless) layer, and runs the application.

## How big is it?
18.9MB 😲
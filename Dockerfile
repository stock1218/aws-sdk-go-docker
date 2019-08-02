FROM golang:alpine as build

WORKDIR /go/src/app
COPY . .

# Install dep and satisfy dependencies
RUN apk add dep
RUN dep ensure

# Build and install program
RUN go install -v ./...

FROM gcr.io/distroless/base
COPY --from=build /go/bin/app /
CMD ["/app"]
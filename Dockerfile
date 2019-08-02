FROM golang as build

WORKDIR /go/src/app
COPY . .

# Install dep and satisfy dependencies
RUN curl -s https://raw.githubusercontent.com/golang/dep/master/install.sh | sh > /dev/null
RUN dep ensure

# Build and install program
RUN go install -v ./...

# Squash and run
FROM gcr.io/distroless/base
COPY --from=build /go/bin/app /
CMD ["/app"]
FROM golang:1.20.0 AS base

RUN apt-get update && \
    apt-get -y --no-install-recommends install software-properties-common && \
    add-apt-repository "deb http://httpredir.debian.org/debian bullseye main" && \
    apt-get update && \
    apt-get -qq install -y nano


FROM base AS build
ARG TARGETOS
ARG TARGETARCH
ENV CGO_ENABLED=1
ENV TARGETOS=linux
ENV CC=gcc

WORKDIR /app

COPY . .

# Build the Go app for a smaller binary with no debug information.
RUN go build -o go-vulnerable




# Command to run the application.
#ENTRYPOINT ["/go-vulnerable"]

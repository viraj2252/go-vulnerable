FROM golang:1.20.1 AS base

RUN apt-get update && \
    apt-get -y --no-install-recommends install software-properties-common && \
    add-apt-repository "deb http://httpredir.debian.org/debian bullseye main" && \
    apt-get update && \
    apt-get -qq install -y nano build-essential strace gccgo


FROM base AS build
ENV CGO_ENABLED=1

WORKDIR /app

COPY . .

# Build the Go app for a smaller binary with no debug information.
RUN gcc -shared -o evil.so evil.c
#RUN go build -o go-vulnerable


#FROM scratch

# Copy the binary from builder to this new stage.
#COPY --from=build /app/go-vulnerable /go-vulnerable


# Command to run the application.
#ENTRYPOINT ["/go-vulnerable"]

# This is based on my generic golang two-stage
# Docker build. Set variables in docker-compose.

### ------ BUILD STAGE -----------------------------
FROM golang:1.15 as build-stage
WORKDIR /wrk/cars
COPY . .
RUN CGO_ENABLED=0 go build -o ./bin/cars -a -installsuffix cgo ./src/main.go

### ------- RUN STAGE ------------------------------
FROM alpine:latest as run-stage
RUN apk --no-cache add ca-certificates
WORKDIR /app/
COPY --from=build-stage /wrk/cars/bin/cars .

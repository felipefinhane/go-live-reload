FROM golang:1.21.1-alpine3.18 as base
WORKDIR /app

FROM base as dev
RUN go install github.com/codegangsta/gin@latest
CMD ["gin", "run", "main.go"]

FROM base as build
COPY ./app/ /app
RUN CGO_ENABLED=0 go build -o app .

FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/app /app
ENTRYPOINT ["/app/app"]

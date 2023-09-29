FROM golang:1.21.1-alpine3.18
WORKDIR /app
RUN go install github.com/codegangsta/gin@latest

CMD ["gin", "run", "main.go"]

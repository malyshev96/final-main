FROM golang:1.24.11
WORKDIR /app
RUN go mod init github.com/malyshev96/final-main
RUN go mod tidy
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main
CMD ["/main"]
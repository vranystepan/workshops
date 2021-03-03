FROM registry.access.redhat.com/ubi8/go-toolset
COPY app/* ./
RUN GOOS=linux GOARCH=amd64 go build main.go
CMD ["./main"]
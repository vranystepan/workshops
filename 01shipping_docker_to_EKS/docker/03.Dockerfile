FROM registry.access.redhat.com/ubi8/go-toolset AS build
COPY app/* ./
RUN GOOS=linux GOARCH=amd64 go build main.go

FROM registry.access.redhat.com/ubi8/ubi-minimal
COPY --from=build /opt/app-root/src/main ./
CMD ["./main"]
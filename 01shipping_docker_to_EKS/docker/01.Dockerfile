FROM registry.access.redhat.com/ubi8/ubi-minimal
COPY app/main ./
CMD ["./main"]
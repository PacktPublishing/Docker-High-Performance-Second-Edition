FROM golang:1.11-stretch

ADD hello.go hello.go
RUN go build hello.go

# Good to have a base image that has some debugging tools
FROM busybox

COPY --from=0 /go/hello /app/hello
COPY --from=0 /lib/x86_64-linux-gnu/libpthread.so.0 \
              /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=0 /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=0 /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["./hello"]

#############
# Build
#############
FROM golang:alpine as build

ARG BUILD_TAG

WORKDIR /app

COPY . /app

RUN go build -o /usr/bin/helloworld $BUILD_TAG

CMD ["/usr/bin/helloworld"]


#############
# Release
#############
FROM alpine:latest as release

RUN addgroup -g 1000 golang; \
    adduser -H -s /bin/false -u 1000 -G golang -S -D golang

COPY --from=build /usr/bin/helloworld /usr/bin

USER golang

EXPOSE 8080

CMD ["/usr/bin/helloworld"]

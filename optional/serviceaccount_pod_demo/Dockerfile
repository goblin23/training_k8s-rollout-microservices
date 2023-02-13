FROM ubuntu:20.04

RUN apt-get update &&\
apt-get install -y curl &&\
curl -o /usr/local/bin/kubectl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
chmod 755 /usr/local/bin/kubectl

COPY get-pod-curl.sh /root

WORKDIR /root

CMD /bin/bash
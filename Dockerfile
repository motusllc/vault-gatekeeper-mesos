FROM golang:alpine

ENV GIN_MODE release
RUN apk add --update git bash && rm -rf /var/cache/apk/*
ADD . $GOPATH/src/github.com/channelmeter/vault-gatekeeper-mesos
RUN cd $GOPATH/src/github.com/channelmeter/vault-gatekeeper-mesos && \
	go get && /bin/bash ./build.bash && cp ./vltgatekeeper /bin/vltgatekeeper

EXPOSE 9201

ENTRYPOINT ["/bin/vltgatekeeper"]

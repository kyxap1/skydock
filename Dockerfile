FROM crosbymichael/golang

# go get to download all the deps
RUN git clone https://github.com/skynetservices/skydns1 /go/src/github.com/skynetservices/skydns

RUN go get -u github.com/crosbymichael/skydock

ADD . /go/src/github.com/crosbymichael/skydock
ADD plugins/ /plugins

RUN cd /go/src/github.com/crosbymichael/skydock && go install . ./...

ENTRYPOINT ["/go/bin/skydock"]

FROM golang:alpine

WORKDIR /go/src/app
RUN apk add --no-cache git && \
    go get -v github.com/Sean-Der/fail2rest && \
    cd $GOPATH/src/github.com/Sean-Der/fail2rest && \
    rm config.json && \
    echo "{ \"Addr\": \"127.0.0.1:5000\", \"Fail2banSocket\": \"/var/run/fail2ban/fail2ban.sock\" }" >> config.json
CMD go run *.go 

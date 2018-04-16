FROM alpine:latest

RUN apk add --no-cache go git build-base && \
    go get github.com/Sean-Der/fail2rest && \
    cd $GOPATH/src/github.com/Sean-Der/fail2rest && \
    rm config.json && \
    echo "{ \"Addr\": \"127.0.0.1:5000\", \"Fail2banSocket\": \"/var/run/fail2ban/fail2ban.sock\" }" >> config.json
CMD go run *.go 

FROM alpine:3 as builder
RUN apk add curl
RUN apk add tar
WORKDIR /data
ENV VERSION="0.33.0"
RUN curl -Lso frp.tar.gz "https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz"
RUN tar xvf frp.tar.gz --strip-components=1 "frp_${VERSION}_linux_amd64/frpc"
RUN tar xvf frp.tar.gz --strip-components=1 "frp_${VERSION}_linux_amd64/frps"

FROM alpine:3
COPY --from=builder /data/frpc /usr/local/bin/frpc
RUN chmod +x /usr/local/bin/frpc
COPY --from=builder /data/frps /usr/local/bin/frps
RUN chmod +x /usr/local/bin/frps
COPY ./command.sh /command.sh
RUN chmod +x /command.sh
CMD [ "/command.sh" ]

FROM docker:29.9.3-cli-alpine3.24

WORKDIR /app

RUN apk add --no-cache git

COPY --chmod=755 builder.sh .

ENTRYPOINT ["./builder.sh"]
FROM node:alpine AS assetbuilder
WORKDIR /app
COPY package*.json ./
COPY gulpfile.js ./
COPY assets/ ./assets/
RUN npm install && NODE_ENV=production ./node_modules/gulp/bin/gulp.js

FROM golang:latest AS binarybuilder
WORKDIR /go/src/github.com/dannyvankooten/bunseki
COPY . /go/src/github.com/dannyvankooten/bunseki
COPY --from=assetbuilder /app/assets/build ./assets/build
RUN make docker

FROM alpine:latest
EXPOSE 8080
HEALTHCHECK --retries=10 CMD ["wget", "-qO-", "http://localhost:8080/health"]
RUN apk add --update --no-cache bash ca-certificates
WORKDIR /app
COPY --from=binarybuilder /go/src/github.com/dannyvankooten/bunseki/bunseki .
CMD ["./bunseki", "server"]

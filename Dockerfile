FROM golang:1.18-buster as base

WORKDIR /app

COPY .air.toml .

COPY go.mod .
COPY go.sum .

RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s

FROM base as runner

COPY *.go .
COPY routes routes
COPY middlewares middlewares
CMD ["./bin/air"]
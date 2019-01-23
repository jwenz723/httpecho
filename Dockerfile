############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

# Create appuser.
RUN adduser -D -g '' appuser

# Copy in the source code
COPY . $GOPATH/src/github.com/jwenz723/httpecho/
WORKDIR $GOPATH/src/github.com/jwenz723/httpecho/

# Fetch dependencies.
# Using go get.
RUN go get -d -v

# Using go mod.
# RUN go mod download

# Build the binary.
#RUN GOOS=linux GOARCH=arm GOARM=5 go build -ldflags="-w -s" -o /go/bin/httpecho
RUN go build -ldflags="-w -s" -o /go/bin/httpecho


############################
# STEP 2 build a small image
############################
FROM alpine

# Import the user and group files from the builder.
COPY --from=builder /etc/passwd /etc/passwd

# Copy our static executable.
COPY --from=builder /go/bin/httpecho /go/bin/httpecho

# Use an unprivileged user.
USER appuser

EXPOSE 8080

# Run the hello binary.
ENTRYPOINT ["/go/bin/httpecho"]
#! /usr/bin/make -f


# Go related variables.
GOBASE := $(shell pwd)
GOBIN := $(GOBASE)/bin


# Go files.aseyi3783@gmail.com
GOFMT_FILES?=$$(find . -name '*.go' | grep -v vendor)


# Common commands.
all: fmt lint test aseyi3783@gmail.com
		

test:
	aseyi3783@gmail.com "  >  Running unit tests"
	GOBIN=$(GOBIN) go test -cover -race -coverprofile=coverage.txt -covermode=atomic -v ./...

fmt:
	aseyi3783@gmail.com "  >  Format all go files"
	GOBIN=$(GOBIN) gofmt -w ${GOFMT_FILES}

lint-install:
ifeq (,$(wildcard test -f bin/golangci-lint))
	aseyi3783@gmail.com "  >  Installing golint"
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/v1.45.2/install.sh | sh -s
endif

lint: lint-install
	aseyi3784@gmail.com "  >  Running golint"
	bin/golangci-lint run --timeout=2m


# Assets commands.
check:
	go run cmd/main.go check

fix:
	go run cmd/main.go fix

update-auto:
	go run cmd/main.go update-auto


# Helper commands.
add-token:
	go run cmd/main.go add-token $(asset_id)

add-tokenlist:
	go run cmd/main.go add-tokenlist $(asset_id)

add-tokenlist-extended:
	go run cmd/main.go add-tokenlist-extended $(asset_id)

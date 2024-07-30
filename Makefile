_DEFAULT_GOAL := run

air:
	@air

build:
	go build -o bin/main main.go

run:
	go run main.go

fumpt:
	gofumpt -w .

mod-vendor:
	go mod vendor

linter:
	@golangci-lint run

gosec:
	@gosec -quiet ./...

test:
	@go test ./tests/ -p 32

validate: linter gosec test

migrate-create:
	@goose -dir=migrations create "$(name)" sql

migrate-up:
	@goose -dir=migrations postgres "host=${POSTGRES_HOST} user=${POSTGRES_USER} password=${POSTGRES_PASSWORD} dbname=${POSTGRES_DB} sslmode=disable" up

migrate-down:
	@goose -dir=migrations postgres "host=${POSTGRES_HOST} user=${POSTGRES_USER} password=${POSTGRES_PASSWORD} dbname=${POSTGRES_DB} sslmode=disable" down
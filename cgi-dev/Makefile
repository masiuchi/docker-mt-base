TEST_FILES ?= t plugins/*/t

default:

start:
	docker-compose up -d

stop:
	docker-compose stop

test: start
	docker-compose exec apache prove $(TEST_FILES)

clean: stop
	docker-compose down -v
	rm -rf mysql/*
	rm -rf html/*


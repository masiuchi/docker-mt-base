TEST_DOCKER_IMAGE ?= masiuchi/docker-mt-test:trusty-full
TEST_FILES ?= t plugins/*/t
TEST_JOB_COUNT ?= 4
TEST_PARALLEL_OPTIONS ?= -j$(TEST_JOB_COUNT) -PMySQLPool -It/lib

default:

start:
	docker-compose up -d

stop:
	docker-compose stop

test:
	docker run --rm -it -v $$PWD/movabletype:/mt -w /mt $(TEST_DOCKER_IMAGE) bash -c "prove $(TEST_PARALLEL_OPTIONS) $(TEST_FILES)"

test_single:
	docker run --rm -t -v $$PWD/movabletype:/mt -w /mt $(TEST_DOCKER_IMAGE) bash -c "prove $(TEST_FILES)"

test_php:
	docker run --rm -t -v $$PWD/movabletype:/mt -w /mt $(TEST_DOCKER_IMAGE) bash -c "make test-phpunit && make test-php-lint"

clean: stop
	docker-compose down -v
	rm -rf mysql/*
	rm -rf html/*


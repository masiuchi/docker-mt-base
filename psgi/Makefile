default:

start:
	docker-compose up -d

stop:
	docker-compose stop

clean: stop
	docker-compose down -v
	rm -rf html/*
	rm -rf mysql/*


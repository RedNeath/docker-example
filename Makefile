owner != whoami

run:
	docker compose up -d

start:
	docker compose up

stop:
	docker compose down

db:
	docker exec -it docker-example-db-1 mysql -udocker-example-user -p

db-root:
	docker exec -it docker-example-db-1 mysql -uroot -p




wsh:
	docker exec -it docker-example-web-1 bash

vsh:
	docker exec -it docker-example-vue-1 sh

owner:
	sudo chown -R $(owner):$(owner) ./docker-example-*



tests: tests-front tests-back

tests-front:
	docker exec -it docker-example-vue-1 npm run test

tests-back:
	docker exec -it docker-example-web-1 php bin/phpunit --testdox

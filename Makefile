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




web-bash:
	docker exec -it docker-example-web-1 bash

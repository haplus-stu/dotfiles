PROJECT_NAME={{_input_:project_name}}
SERVER_CMD= 
NAME=none

restart: up

up:
	docker-compose up -d

stop:
	docker stop $(docker ps -qa)

del:
	docker stop `docker ps -qa` && docker rm `docker ps -qa`

exec:
	docker exec -it ${NAME} bash

serve:
	docker-compose exec web bash -c 'cd ${PROJECT_NAME} && ${SERVER_CMD}'

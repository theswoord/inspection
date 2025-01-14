.PHONY: all clean up down stop start env status

all:  up

clean:
	@sudo docker system prune -af

up: env
	@mkdir -p /home/nbouhali/data/mariadb
	@mkdir -p /home/nbouhali/data/wordpress
	@echo "Volumes created!"
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo rm -rf /home/nbouhali/data/*
	@sudo rm -rf ./srcs/.env

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

env:
	@touch ./srcs/.env
	@cp /home/kali/Desktop/.env ./srcs/

status:
	@docker ps
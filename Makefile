all:
	@mkdir -p /home/adiaz-uf/data/mysql
	@mkdir -p /home/adiaz-uf/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

fclean:
	@sudo rm -rf /home/adiaz-uf/data/mysql/*
	@sudo rm -rf /home/adiaz-uf/data/wordpress/*
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm network

re: fclean all

.PHONY: all down clean

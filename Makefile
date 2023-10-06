all:
	@sudo mkdir -p /home/zak/data/db /home/zak/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

install :
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker docker-compose
	@sudo mkdir -p /home/zak/data/db /home/zak/data/wordpress
	
restart :
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls -q)
	@sudo rm -rf /home/zak/data
	@docker image rm -f $$(docker image ls -q)
	@docker network rm mynetwork

.PHONY: all clean fclean re
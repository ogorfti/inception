name = inception
RESET = \033[0m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m

all:
# @echo "$(YELLOW)Launch configuration ${name}... $(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
# 	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
# @printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

# re: down
# 	@printf "Rebuild configuration ${name}...\n"
# 	@docker-compose -f ./docker-compose.yml up -d --build

clean: down
# @printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

fclean:
# @printf "Total clean of all configurations docker\n"
	# @docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
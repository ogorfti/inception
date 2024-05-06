YAML = ./srcs/docker-compose.yml

RESET = \033[0m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m


all: run

run: dir
	@echo "$(YELLOW)Building and starting containers...$(RESET)"
	@docker-compose -f $(YAML) up -d --build

up:
	@echo "$(YELLOW)Starting containers...$(RESET)"
	@docker-compose -f $(YAML) up -d

down:
	@echo "$(YELLOW)Stopping containers...$(RESET)"
	@docker-compose -f $(YAML) down

dir:
	@echo "$(YELLOW)Creating volume directories...$(RESET)"
	@mkdir -p /home/$(USER)/inception/data/wordpress
	@mkdir -p /home/$(USER)/inception/data/mariadb

undir:
	@echo "$(YELLOW)Removing volume directories...$(RESET)"
	@sudo rm -rf /home/$(USER)/inception/data/wordpress
	@sudo rm -rf /home/$(USER)/inception/data/mariadb

#prune -af: unused volumes, networks, images, and stopped containers

clean: down
	@echo "$(RED)Removing Docker resources...$(RESET)"
	@docker system prune -af
	@echo "$(RED)Removing Docker volumes...$(RESET)"
	@if [ "`docker volume ls -q`" != "" ]; then docker volume rm `docker volume ls -q`; fi
	@echo "$(RED)Deleting data directories...$(RESET)"
	@sudo rm -rf /home/$(USER)/inception/data/wordpress
	@sudo rm -rf /home/$(USER)/inception/data/mariadb
	@echo "$(RED)Cleanup complete.$(RESET)"
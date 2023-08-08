# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsever <gsever@student.42kocaeli.com.tr    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/30 08:37:05 by gsever            #+#    #+#              #
#    Updated: 2023/07/05 09:13:28 by gsever           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	COLORS --> 🟥 🟩 🟦
BLACK	= \033[0;30m
RED		= \033[0;31m
GREEN	= \033[0;32m
YELLOW	= \033[0;33m
BLUE	= \033[0;34m
PURPLE	= \033[0;35m
CYAN	= \033[0;36m
WHITE	= \033[0;37m
END		= \033[m
RESET	= \033[0m
X		= \033[m

#	COLORS BOLD--> B🟥 B🟩 B🟦
B_CYAN		= \033[1;36m
B_BLUE		= \033[1;34m
B_YELLOW	= \033[1;33m
B_GREEN		= \033[1;32m
B_RED		= \033[1;31m
B_RESET		= \033[1m
#NOTE: \033[ ile derlenince calisiyor \e[ ile derlenince bozuk calisiyor.

.PHONY: all build up clean fclean cleansh re info

# all:
# 	@$(MAKE) build up -j $(NUMPROC) --no-print-directory

all: build up

build:
# mkdir -p /home/$(USER)/data/mysql
# mkdir -p /home/$(USER)/data/wordpress
# mkdir -p /home/$(USER)/data/prt
# @docker-compose -f srcs/docker-compose.yml build --parallel

up:
	mkdir -p /home/$(USER)/data/mysql
	mkdir -p /home/$(USER)/data/wordpress
# @mkdir -p /home/$(USER)/data/prt
# @docker-compose -f srcs/docker-compose.yml up -d
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: 
	docker-compose -f srcs/docker-compose.yml down
	docker container stop $(shell docker ps -qa)
	docker container rm $(shell docker ps -qa)

# There is have 2 way run a command with shell argument.
# remove_all_containers:
# 	docker container rm $$(docker ps -aq) -f
# remove_all_containers:
# 	docker container rm $(shell docker ps -aq) -f

fclean: clean
	docker rmi -f $$(docker images -qa) 2>/dev/null
	docker volume rm $$(docker volume ls -q) 2>/dev/null
	docker network rm $$(docker network ls -q) 2>/dev/null
	docker system prune -a --volume 2>/dev/null
	docker system prune -a --force 2>/dev/null
	sudo rm -rf /home/$(USER)/data 2>/dev/null

cleansh:
	@chmod 744 clean.sh
	@./clean.sh

re:
	@$(MAKE) fclean --no-print-directory
	@$(MAKE) all --no-print-directory

info:
	@echo "$(CYAN)=================== IMAGES =====================$(END)"
	@docker images -a
	@echo
	@echo "$(GREEN)========================= RUNNING CONTAINERS =========================$(END)"
	@docker ps
	@echo
	@echo "$(YELLOW)============================= CONTAINERS =============================$(END)"
	@docker ps -a
	@echo
	@echo "$(BLUE)=============== NETWORKS ===============$(END)"
	@docker network ls
	@echo
	@echo "$(PURPLE)====== VOLUMES ======$(END)"
	@docker volume ls
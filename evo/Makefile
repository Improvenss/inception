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

#	All process use for compiling.
UNAME		:= $(shell uname -s)
NUMPROC		:= 8

OS			:= NULL

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

#	Compiling with all threads.
ifeq ($(UNAME), Linux)
	NUMPROC	:= $(shell grep -c ^processor /proc/cpuinfo)
	OS = "You are connected from -$(CYAN)$(UNAME)$(X)- 🐧 Welcome -$(CYAN)$(USER)$(X)- 😄!"
else ifeq ($(UNAME), Darwin)
	NUMPROC	:= $(shell sysctl -n hw.ncpu)
	OS = "You are connected from 42 school's iMac 🖥 ! Welcome $(CYAN)$(USER)$(X)"
	ifeq ($(USER), yuandre)
		OS = "You are connected from -$(CYAN)MacBook$(X)- 💻 Welcome -$(CYAN)$(USER)$(X)-!"
	endif
endif
# You can use --> man sysctl -> shell: sysctl -a | grep "hw.ncpu"


# all:
# 	@$(MAKE) build up -j $(NUMPROC) --no-print-directory

all: build up clean_dangling_images

build:
	@echo "$(GREEN)BUILDING CONTAINER IMAGES 'build'$(X)"
	@mkdir -p /home/$(USER)/data/mysql
	@mkdir -p /home/$(USER)/data/wordpress
# @mkdir -p /home/$(USER)/data/prt
# @docker-compose -f srcs/docker-compose.yml build
	@docker-compose -f srcs/docker-compose.yml build --parallel
# @docker-compose -f srcs/docker-compose.yml build --quiet
# @docker-compose -f srcs/docker-compose.yml build --progress=plain
# @docker-compose -f srcs/docker-compose.yml build | pv -f -L 5 -s57 > /dev/null
# @docker-compose -f srcs/docker-compose.yml build | pv -lep -s $$(docker-compose -f srcs/docker-compose.yml config | grep "service:" | wc -l) > /dev/null
# @docker-compose -f srcs/docker-compose.yml build --parallel | pv -lep -s $$(docker-compose -f srcs/docker-compose.yml config | grep "service:" | wc -l) > /dev/null
	@echo $(OS) Builded with $(NUMPROC) cores!

up: update_hosts
	@printf "%-57b %b" "$(GREEN)RUNNING CONTAINERS 'up'$(END)\n"
	@mkdir -p /home/$(USER)/data/db
	@mkdir -p /home/$(USER)/data/wp
	@mkdir -p /home/$(USER)/data/prt
	@docker-compose -f srcs/docker-compose.yml up -d
# @docker-compose -f srcs/docker-compose.yml up -d --progress=plain
# @docker-compose -f srcs/docker-compose.yml up -d | pv -f -L 5 -s57 > /dev/null
# @docker-compose -f srcs/docker-compose.yml up -d | pv -lep -s $$(docker-compose -f srcs/docker-compose.yml config | grep "service:" | wc -l) > /dev/null
# @docker-compose -f srcs/docker-compose.yml up -d --build
	@echo $(OS) Runned with $(NUMPROC) cores!

start:
	@docker start $$(docker ps -qa) 2>/dev/null | pv -f -L 5 -s $$(docker ps -qa | wc -l) > /dev/null
# @docker start $$(docker ps -qa) 2>/dev/null | awk '{ print "$(B_GREEN)" $$0 "$(END)" }'

stop:
# @docker stop $$(docker ps -qa) | pv -f -L 5 -s57 > /dev/null
	@docker stop $$(docker ps -qa) 2>/dev/null | pv -f -L 5 -s $$(docker ps -qa | wc -l) > /dev/null


down:
	@printf "%-57b %b" "$(GREEN)CLOSING CONTAINERS 'down'$(X)\n"
	@docker-compose -f srcs/docker-compose.yml down
	@echo $(OS) Closed with $(NUMPROC) cores!

# pvmake:
# 	@docker-compose -f srcs/docker-compose.yml build nginx | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build mariadb | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build wordpress | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build adminer | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build redis | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build ftp-server | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build hugo | pv -f -L 5 -s57 > /dev/null
# 	@docker-compose -f srcs/docker-compose.yml build static_page | pv -f -L 5 -s57 > /dev/null

clean:
	@docker-compose -f srcs/docker-compose.yml down
# docker container stop $(shell docker ps -qa)
# docker container rm $$(shell docker ps -qa)
# @docker container prune -f 2>/dev/null
# @echo "Cleaned with $(NUMPROC) cores!"
	@echo "$(RED)STOPPED AND CLEANED JUST CONTAINERS$(RESET)"

# There is have 2 way run a command with shell argument.
# remove_all_containers:
# 	docker container rm $$(docker ps -aq) -f
# remove_all_containers:
# 	docker container rm $(shell docker ps -aq) -f

fclean: clean
# docker rmi -f $$(docker images -qa) 2>/dev/null
# @docker image prune -f 2>/dev/null
# docker volume rm $$(docker volume ls -q) 2>/dev/null
# docker volume prune -f
# docker network rm $$(docker network ls -q) 2>/dev/null
# @docker network prune -f
# @docker system prune -a --volume --force 2>/dev/null
	@docker system prune -fa 2>/dev/null
	@sudo rm -rf /home/$(USER)/data 2>/dev/null
	@echo "Cleaned with $(NUMPROC) cores!"
	@echo "$(RED)ALL THINGS CLEANED$(RESET)"

cleansh:
	@chmod 744 clean.sh
	@./clean.sh

clean_dangling_images:
	@docker image prune --all --force

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

compose_containers:
	@docker-compose -f ./srcs/docker-compose.yml ps -a

compose_images:
	@docker-compose -f ./srcs/docker-compose.yml images

# update_ssl:
# 	@cp /home/$(USER)/data/wordpress/gsever.crt /etc/ssl/certs/
# 	@sudo update-ca-certificates
# 	@echo "$(B_GREEN)WORKING Update SSL$(END)"

# @certutil -A -n "gsever" -t "TCu,Cu,Tu" -i "/home/gsever/data/wordpress/gsever.crt" -d sql:$(HOME)/.mozilla/firefox/*default

update_hosts:
	@if grep -q "127.0.0.0	$(USER).42.fr" /etc/hosts; then\
		echo "$(YELLOW)Host Already Exist: /etc/hosts: $(B_YELLOW)'127.0.0.0 $(USER).42.fr'$(END)";\
	else\
		sudo sed -i '2i127.0.0.0\t$(USER).42.fr' /etc/hosts;\
		echo "$(B_GREEN)Adding 'gsever.42.fr' host to /etc/hosts inside.$(END)";\
	fi
# @sed -i '2s/^/127.0.0.0\tgsever.42.fr\n/' /etc/hosts

#Linux sistemine SSH (Secure Shell) erişimi sağlamak için gerekli ayarları yapmayı amaçlar.
setup_ssh: ## It aims to make the necessary settings to provide SSH (Secure Shell) access to the Linux system.
	sudo usermod -aG sudo $(USER)
	if ! sudo grep -q "$(USER) ALL=(ALL:ALL) ALL" /etc/sudoers; then \
		echo "$(USER) ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers; \
	fi
	sudo apt install openssh-server -y
	sudo apt install ufw -y
	sudo apt-get install wget -y
	sudo service ssh restart
	if ! sudo grep -q "Port 4242" /etc/ssh/sshd_config; then \
		echo "Port 4242" | sudo tee -a /etc/ssh/sshd_config; \
	fi
	if ! sudo grep -q "PermitRootLogin yes" /etc/ssh/sshd_config; then \
		echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config; \
	fi
	if ! sudo grep -q "PasswordAuthentication yes" /etc/ssh/sshd_config; then \
		echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config; \
	fi
	sudo systemctl restart sshd
	sudo service ssh restart
	sudo ufw enable
	sudo ufw allow ssh
	sudo ufw allow 4242
	sudo ufw allow 3306
	sudo ufw allow 80
	sudo ufw allow 443
	sudo ufw allow OpenSSH
	sudo ufw enable
	@echo "...then add port(4242) for Virtual Machine"
	@echo "Now you can connect to your VM in this way from your own terminal: 'ssh user_name@localhost -p 4242' or ssh root@localhost -p 4242"
	@echo "if you can't connect, check the 'known_hosts' file example: 'rm -rf /home/gsever/.ssh/known_hosts'"


firstrun:
	@echo "$(B_GREEN)FirstRun: Updating Debian OS.$(END)"
	@apt update
	@echo "$(B_GREEN)FirstRun: Upgrading Debian OS.$(END)"
	@apt upgrade -y
	@echo "$(B_GREEN)FirstRun: Installing: 'docker.io', 'docker-compose', 'apt-utils'.$(END)"
	@apt install -y docker.io docker-compose apt-utils
	@echo "$(B_GREEN)FirstRun: Installing: 'vim', 'wget', 'curl', 'pv'.$(END)"
	@apt install -y vim wget curl pv
	@echo "$(B_GREEN)FirstRun: Installing: 'certutil' for trusted certificate.$(END)"
	@apt install -y libnss3-tools

.PHONY: all build up start stop down clean fclean cleansh clean_dangling_images re info container_info update_hosts setup_ssh firstrun

# How can i transfer file with 'sftp' protocol local to virtual machine?
# $> sftp gsever@localhost
# $> <virtual_machine_password>
# $> put <file> <destination>
# $> get <file> <destination>
#
# How can i check TLSv1.2 and TLSv1.3 is working?
# openssl s_client -connect localhost:443 -tls1_2
# openssl s_client -connect localhost:443 -tls1_3

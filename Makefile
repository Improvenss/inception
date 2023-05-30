# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsever <gsever@student.42kocaeli.com.tr    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/10 16:29:25 by gsever            #+#    #+#              #
#    Updated: 2023/05/23 16:57:40 by gsever           ###   ########.fr        #
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

.PHONY: all clean fclean re

all: build up
	@$(MAKE) build up -j $(NUMPROC) --no-print-directory

build:
	@printf "%-57b %b" "$(GREEN)BUILDING CONTAINER IMAGES$(X)\n"
	docker-compose -f ./srcs/docker-compose.yml build
	@echo $(OS) Builded with $(NUMPROC) cores!

up:
	@printf "%-57b %b" "$(GREEN)RUNNING CONTAINERS$(X)\n"
	docker-compose -f ./srcs/docker-compose.yml up -d
	@echo $(OS) Runned with $(NUMPROC) cores!

clean: 
	@echo "$(NAME): $(RED)$(OBJECTS) was deleted$(RESET)"

fclean: clean
	@echo "$(NAME): $(RED)$(NAME) was deleted$(RESET)"

re:
	@$(MAKE) fclean --no-print-directory
	@$(MAKE) all --no-print-directory

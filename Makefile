BLUE	=\033[0;35m
GREEN	=\033[0;36m
YELLOW	=\033[0;33m

APPNAME = onion:v1
CLINAME = client:v1
CONT_NAME = tontainer
CLICONT_NAME = client
BUILD_DIR = ./src
CLIBUILD_DIR = ./cli

all:	br	clibr

build:
	docker build -t ${APPNAME} ${BUILD_DIR}

run:
	docker run -d --name ${CONT_NAME} ${APPNAME}

br:	build	run

clibuild:
	docker build -t ${CLINAME} ${CLIBUILD_DIR}

clirun:
	docker run -d --name ${CLICONT_NAME} ${CLINAME}

clibr:	clibuild	clirun

onionexec:
	docker exec -it ${CONT_NAME} bash

cliexec:
	docker exec -it ${CLICONT_NAME} bash

all:	br	clibr

list:
	@echo "${BLUE}"
	docker ps -a
	@echo "${GREEN}"
	docker ps
	@echo "${YELLOW}"
	docker images

delete:
	docker stop ${CLICONT_NAME} ${CONT_NAME}
	docker rm ${CLICONT_NAME} ${CONT_NAME}
	docker rmi ${APPNAME} ${CLINAME}

help:
	@echo "${BLUE}GENERAL COMMANDS:\033[2;37m"
	@echo "[make] builds main proyect and client images, and runs both containers"
	@echo "[onionexec] and [cliexec] executes container with bash"
	@echo "[list] shows images and all containers"
	@echo "[delete] stops running containers and delete them and the containers too"

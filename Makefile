.DEFAULT_GOAL := run_debian

include .env
BASE_PACKAGES := ${DEFAULT_SHELL} vim tmux sudo locales-all man
BASE_PACKAGES += zip unzip xz-utils libncurses-dev libbz2-dev libssl-dev libffi-dev libreadline-dev
BASE_PACKAGES += git wget curl make python3 python3-venv python3-pip
BASE_PACKAGES += iputils-ping dnsutils httpie
export

build_%: 
	docker compose build $*

run_%: build_%
	docker compose up --detach
	docker compose exec $* ${DEFAULT_SHELL} -c ~/.dotfiles/install
	docker compose exec $* ${DEFAULT_SHELL}

export_%: container_name = export_$*
export_%: build_%
	docker container run --name $(container_name) ${DOCKER_REPOSITORY}:$* cat /etc/os-release
	docker container export --output="/mnt/c/Temp/$*.tar" $(container_name)
	docker container rm $(container_name)

clean:
	docker compose down

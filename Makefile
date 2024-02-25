.DEFAULT_GOAL := run_debian

include .env
BASE_PACKAGES := ${DEFAULT_SHELL} vim tmux
BASE_PACKAGES += sudo locales-all man zip unzip xz-utils
BASE_PACKAGES += git wget curl make python3 python3-venv
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

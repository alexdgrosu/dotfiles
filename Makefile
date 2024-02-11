.DEFAULT_GOAL := run_debian

include .env
BASE_PACKAGES := ${DEFAULT_SHELL}
BASE_PACKAGES += sudo locales-all make man
BASE_PACKAGES += git vim zip unzip curl python3
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

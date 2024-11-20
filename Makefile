.DEFAULT_GOAL := run_debian

include .env
BASE_PACKAGES := ${DEFAULT_SHELL} sudo man locales-all build-essential xz-utils tk-dev
BASE_PACKAGES += libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev
BASE_PACKAGES += libncursesw5-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
BASE_PACKAGES += procps git curl wget tmux vim zip unzip 
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

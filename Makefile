.DEFAULT_GOAL := run_debian

include .env
BASE_PACKAGES := sudo locales-all man git curl
export

build_%:
	docker compose build $*

run_%: build_%
	docker compose up --detach
	docker compose exec $* sh -c ~/dotfiles/install.sh
	docker compose exec $* ${DEFAULT_SHELL}

clean:
	docker compose down

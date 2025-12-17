.DEFAULT_GOAL := run_debian

include .env
BASE_PACKAGES := sudo locales-all man git curl
export

build_%:
	docker compose build $*

run_%: build_%
	docker compose up --detach $*
	docker compose exec $* sh -c ~/.config/local/share/chezmoi/install.sh
	docker compose exec $* ${DEFAULT_SHELL}

clean:
	docker compose down

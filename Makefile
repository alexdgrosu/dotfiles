.DEFAULT_GOAL := run_debian

include .env
export

build_%:
	docker compose build $*

run_%: build_%
	docker compose up --detach $*
	docker compose exec $* sh -c ~/.local/share/chezmoi/install.sh
	docker compose exec $* ${DEFAULT_SHELL}

clean:
	docker compose down

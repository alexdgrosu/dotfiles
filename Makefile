.DEFAULT_GOAL := run_debian

include .env
export

build_%:
	docker compose build $*

run_%: build_%
	docker compose up --detach $*
	docker compose exec --workdir /home/${DEFAULT_USER}/.local/share/chezmoi $* sh -c ./install.sh
	docker compose exec --workdir /home/${DEFAULT_USER}/.local/share/chezmoi $* ${DEFAULT_SHELL}

clean:
	docker compose down

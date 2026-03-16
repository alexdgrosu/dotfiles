include .env
export

.PHONY: _default
_default:
	$(error Please specify an OS (e.g. 'make debian') or call a target directly (e.g. 'make clean'))

%: run_%
	@:

build_%:
	docker compose build $*

run_%: build_%
	docker compose up --detach $*
	docker compose exec --workdir /home/${DEFAULT_USER}/.local/share/chezmoi $* sh -c ./install.sh
	docker compose exec --workdir /home/${DEFAULT_USER}/.local/share/chezmoi $* ${DEFAULT_SHELL}

clean:
	docker compose down

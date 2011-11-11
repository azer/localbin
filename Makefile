.PHONY: install
install:
	@git pull && git submodule init && git submodule update && git submodule status
	./install

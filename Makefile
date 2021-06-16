# check if execute command
EXECUTABLES = yarn npx rpm
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "Error : Could not found $(exec) in PATH")))

all: build_linux

build_all:
	yarn package

build_linux:
	npx browserslist@latest --update-db
	yarn package-linux

clean:
	rm -rf release/*

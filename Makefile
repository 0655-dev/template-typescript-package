
##
##
##	MAKEFILE COMMANDS
##	-----------------
##

default: help

##	make help 	- display the help
##
help:
	@ grep "^##.*" ./Makefile


##
##
##	SETUP
##	-----------------
##

##	make setup 	- setup package
##
setup: install

##	make install 	- install dependencies for the package
##
install:
	pnpm install


test: install
	pnpm recursive run test

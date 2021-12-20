# WARNING: this package is a controlled file generated from a template
# do not try to make changes in here, they will be overwritten

ROOT=.
SCRIPTS=./package-scripts

MAKEFILE_EXTRA=Makefile.extras.mk

##
##
##	MAKEFILE COMMANDS
##	-----------------
##

default: help

##	make help 	- display the help
##
help:
	@ grep -h "^##.*" ./Makefile $(MAKEFILE_EXTRA)


##
##
##	SETUP
##	-----------------
##

##	make setup 	- setup package
##
setup: install init

##	make install 	- install dependencies for the package
##
install:
	@ $(SCRIPTS)/package-install.sh

##	make init 	- init package from template
##
init: install
	@ $(ROOT)/package-init.sh


##
##
##	BUILD
##	-----------------
##

##	make build 	- build the src and the docs
##
build: setup
	@ $(SCRIPTS)/package-build.sh

##	make clean 	- remove build artifacts from package
##
clean:
	@ $(SCRIPTS)/package-clean.sh

##	make format	- format the source code (using prettier)
##
format: setup
	@ $(SCRIPTS)/package-prettier-format.sh


##
##
##	TEST
##	-----------------
##

##	make test-typescript 	- run the typescript test cases
##
test-typescript: setup build
	@ $(SCRIPTS)/package-test-typescript.sh

test-mocha: setup build
	@ MOCHA="$(MOCHA)" $(SCRIPTS)/package-test-mocha.sh

##	make test-eslint 	- run the eslint test cases
##
test-eslint: setup build
	@ $(SCRIPTS)/package-test-eslint.sh

##	make test 	- run all tests
##
test: \
	test-typescript \
	test-eslint \
	test-mocha

##
##
##	PUBLISH
##	-----------------
##

##	make publish-check 	- dry run publish - show what files will be published
##
publish-check: setup build
	@ $(SCRIPTS)/package-check-publish.sh

##	make publish 	- publish the package
##
publish: setup build
	@ $(SCRIPTS)/package-publish.sh

##

include $(MAKEFILE_EXTRA)

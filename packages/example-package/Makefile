# WARNING: this package is auto-generated from a template
# do not try to make changes in here, they will be overwritten

ROOT=.
SCRIPTS=./package-scripts

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
setup: install bootstrap

##	make install 	- install dependencies for the package
##
install:
	@ $(SCRIPTS)/package-install.sh

##	make bootstrap 	- bootstrap package from template
##
bootstrap: install
	@ $(ROOT)/package-bootstrap.sh


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


##
##
##	TEST
##	-----------------
##

##	make test-typescript 	- run the typescript test cases
##
test-typescript: setup build
	@ $(SCRIPTS)/package-test-typescript.sh

##	make test-unit-tests 	- run unit tests
##
test-unit-tests: setup build

##	make test-integration-tests 	- run integration test cases
##
test-integration-tests: setup build

##	make test-eslint 	- run the eslint test cases
##
test-eslint: setup build
	@ $(SCRIPTS)/package-test-eslint.sh

##	make test 	- run all tests
##
test: \
	test-typescript \
	test-eslint \
	test-unit-tests \
	test-integration-tests

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

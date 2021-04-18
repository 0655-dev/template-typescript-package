
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
	pnpm install


##	make bootstrap 	- bootstrap package from template
##
bootstrap: install
	pnpm recursive run setup


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

##	make test-unit-tests 	- run the mocha unit test cases
##				- use MOCHA to pass args to mocha,
##				  e.g. `make test-unit-tests MOCHA="--bail"`
##
test-unit-tests: setup build
	@ MOCHA="$(MOCHA)" $(SCRIPTS)/package-test-unit-tests.sh

##	make test-integration-tests 	- run the mocha integration test cases
##				- use MOCHA to pass args to mocha,
##				  e.g. `make test-unit-tests MOCHA="--bail"`
##
test-integration-tests: setup build
	@ MOCHA="$(MOCHA)" $(SCRIPTS)/package-test-integration-tests.sh

##	make test-eslint 	- run the eslint test cases
##
test-eslint: setup build
	@ $(SCRIPTS)/package-test-eslint.sh

##	make test-mocha 	- run the mocha integration test cases
##				- use MOCHA to pass args to mocha,
##				  e.g. `make test-unit-tests MOCHA="--bail"`
##
test-mocha: test-unit-tests test-integration-tests

##	make test 	- run all tests
##			- use MOCHA to pass args to mocha,
##			  e.g. `make test MOCHA="--bail"`
##
test: \
	test-typescript \
	test-eslint \
	test-unit-tests \
	test-integration-tests

##	make test-ci 	- run all tests that should run on the CI server
##
test-ci: \
	test-typescript \
	test-eslint \
	test-unit-tests

##

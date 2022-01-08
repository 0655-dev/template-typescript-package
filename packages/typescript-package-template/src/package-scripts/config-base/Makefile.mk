# WARNING: this package is a controlled file generated from a template
# do not try to make changes in here, they will be overwritten

# if you want to add extra make rules for this package, 
# add rules to config-extras instead


ROOT=.
SCRIPTS=./package-scripts

MAKEFILE_BASE=$(SCRIPTS)/config-base/Makefile.mk
MAKEFILE_EXTRA=$(SCRIPTS)/config-extras/Makefile.mk

##
##
##	MAKEFILE COMMANDS
##	-----------------
##

default: help

##	make help 	- display the help
##
help:
	@ grep -h "^##.*"  $(MAKEFILE_BASE) $(MAKEFILE_EXTRA)


##
##
##	SETUP
##	-----------------
##

##	make install 	- install dependencies for the package
##
install:
	@ $(SCRIPTS)/tasks/package-install.sh

##	make init 	- init package from template
##
init:
	@ $(ROOT)/package-init.sh


##
##
##	BUILD
##	-----------------
##

##	make build 	- build the src and the docs
##
build: init
	@ $(SCRIPTS)/tasks/package-build.sh

##	make clean 	- remove build artifacts from package
##
clean:
	@ $(SCRIPTS)/tasks/package-clean.sh

##	make format	- format the source code (using prettier)
##
format: init
	@ $(SCRIPTS)/tasks/package-prettier-format.sh


##
##
##	TEST
##	-----------------
##

##	make test-typescript 	- run the typescript test cases
##
test-typescript: init build
	@ $(SCRIPTS)/tasks/package-test-typescript.sh

test-mocha: init build
	@ MOCHA="$(MOCHA)" $(SCRIPTS)/tasks/package-test-mocha.sh

##	make test-eslint 	- run the eslint test cases
##
test-eslint: init build
	@ $(SCRIPTS)/tasks/package-test-eslint.sh

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
publish-check: init build
	@ $(SCRIPTS)/tasks/package-check-publish.sh

##	make publish 	- publish the package
##
publish: init build
	@ $(SCRIPTS)/tasks/package-publish.sh

##

include $(MAKEFILE_EXTRA)

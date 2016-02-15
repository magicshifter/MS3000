# Pipeline-oriented Makefile to build and push new firmware to a Magic Shifter 3000 device
#
#

MS3000_NAME?=MS3000
MS3000_PORT?=`pio serialports list --json-output | python -c 'exec("""\nimport json,sys\n\nobj=json.load(sys.stdin)\nfor y in obj:\n if "10C4:EA60" in y["hwid"]:\n  print y["port"]\n""")'`

all: tooling modules flash

tooling:
	@(which pio > /dev/null && echo "You have PlatformIO installed..") || (echo "You must have pio installed, please see: http://platformio.org/" && exit 1) && (which npm > /dev/null && echo "You have NodeJS installed..") || (echo "You must have NodeJS installed, please see: http://nodejs.org/" && exit 1)

MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md:
	git submodule init && git submodule update --recursive
	git submodule foreach git checkout master

modules:	MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md
	make -C MS3000-WebInterface/ install && make -C MS3000-WebInterface/ build
	make -C MS3000-Assets/
	make -C MS3000-Firmware/

filesystem:
	@echo Flashing MagicShifter 3000, named: ${MS3000_NAME} at port: ${MS3000_PORT}
	( cd ./MS3000-Firmware/Tools && ./MS3000_init.sh ${MS3000_NAME} ${MS3000_PORT} )

os:
	@echo "Flashing MS3KOS"
	( cd ./MS3000-Firmware/MS3KOS/ && make test && make monitor )

flash:	modules	filesystem os

update:
	git submodule foreach git pull 
	git submodule foreach git checkout master

# Pipeline-oriented Makefile to build and push new firmware to a Magic Shifter 3000 device
#
#

MS3000_NAME?=MS3000
MS3000_PORT?=`pio serialports list --json-output | python -c 'exec("""\nimport json,sys\n\nobj=json.load(sys.stdin)\nfor y in obj:\n if "10C4:EA60" in y["hwid"]:\n  print y["port"]\n""")'`

all: tooling modules flash

tooling:
	@(which pio > /dev/null && echo "You have PlatformIO installed..") || (echo "You must have pio installed, please see: http://platformio.org/" && exit 1) && (which npm > /dev/null && echo "You have NodeJS installed..") || (echo "You must have NodeJS installed, please see: http://nodejs.org/" && exit 1)

MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md:
	git submodule init && git submodule update --recursive --remote
	git submodule foreach git checkout master

modules:	MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md
	make -C MS3000-WebInterface/ install && make -C MS3000-WebInterface/ build
	make -C MS3000-Assets/
	make -C MS3000-Firmware/

filesystem:
	@echo Flashing filesystem to the MagicShifter 3000, named: ${MS3000_NAME} to be found at port: ${MS3000_PORT}
	@read -p "Make sure the Magic Shifter is on and ready, then: Press any key to continue..." null
	( cd ./MS3000-Firmware/Tools && ./MS3000_init.sh ${MS3000_NAME} ${MS3000_PORT} )

os:
	@echo "Ready to flash the OS to the MagicShifter 3000, then show debug messages .."
	@read -p "Make sure the Magic Shifter is on and ready, then: Press any key to continue..." null
	( cd ./MS3000-Firmware/MS3KOS/ && make test && make monitor )

flash_os:
	@echo "Ready to flash the OS to the MagicShifter 3000."
	@read -p "Make sure your MagicShifter 3000 is plugged in and turned on, then press any key to continue..." null
	( cd ./MS3000-Firmware/MS3KOS/ && make test )


flash:	modules	flash_os filesystem 

update:
	git submodule foreach git pull 
	git submodule foreach git checkout master

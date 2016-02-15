# Pipeline-oriented Makefile to build and push new firmware to a Magic Shifter 3000 device

tooling:
	@(`which pio` > /dev/null && echo "You have PlatformIO installed..") || echo "You must have pio installed, please see: http://platformio.org/"
	@(`which npm` > /dev/null && echo "You have NodeJS installed..") || echo "You must have NodeJS installed, please see: http://nodejs.org/"

MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md:
	git submodule init && git submodule update --recursive

modules:	MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md
	make -C MS3000-WebInterface/ install && make -C MS3000-WebInterface/
	make -C MS3000-Assets/
	make -C MS3000-Firmware/

firmware:


flash:



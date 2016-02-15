# Pipeline-oriented Makefile to build and push new firmware to a Magic Shifter 3000 device

tooling:
	@(`which pio` > /dev/null && echo "You have PlatformIO installed, proceed to make modules ..") || echo "You must have pio installed, please see: http://platformio.org/"

MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md:
	git submodule init && git submodule update --recursive

modules:	MS3000-Assets/README.md MS3000-Firmware/README.md MS3000-WebInterface/README.md
	make -C MS3000-WebInterface/
	make -C MS3000-Assets/
	make -C MS3000-Firmware/

firmware:


flash:




Master Repository for the MagicShifter 3000 Operating System project
====================================================================

Welcome to the MagicShifter 3000 Public Firmware release, source code repository.  

The purpose of this repository is to give you the ability to build your own Firmware for the Magic Shifter 3000 hardware.

For public enquiries, i.e. non-developer information about the Magic Shifter, see http://magicshifter.net/  

We hope that this resource will be of use to anyone who wants to make their Magic Shifter 3000 do cool things.  We'll be helping any way we can - but we do expect that you will know what you are doing beyond this point.  RTFM, and as always: have fun!

License
-------

TODO: MIT License?

Requirements
------------

We use the PlatformIO toolchain to build firmware for the MagicShifter 3000 hardware.  You must have this installed before you proceed. If you know nothing about PlatformIO, please see [PlatformIO](http://platformio.org/) and follow the installation instructions for your preferred dev platform.

Note that our system is designed to be built at the command-line - i.e. we use and support the continued use of the platformio tools at the command-line through a set of Makefiles - this makes it easier to automate building and testing.  We suggest that you feel free to use any IDE you like, once you can at least complete a command-line build first.


Description
------------


The Magic Shifter Operating System is composed of some basic components that are structured independently, but are nevertheless essential to the whole: **Firmware** is the onboard OS for the Magic Shifter 3000, **WebInterface** is the onboard web GUI, and **Assets** are the static resources for the user interface.  

So, this master project contains 3 sub-modules: Firmware, WebInterface and Assets. The components will be built individually and then assembled into a final package that can be flashed to your Magic Shifter 3000.  

Module Facts
------------

*	Firmware: A C/C++ project, targeting the ESP8266 processor used in the Magic Shifter 3000.  The entry point is src/MS3KOS.cpp.
*	WebInterface: a React-based web application designed to be served directly from the Magic Shifter 3000.  
*	Assets: Static files that are needed/used by either of the other components to provide functionality.

Please note: each module has its own README.md too!

Building and Using your own Firmware
------------------------------------

We provide a Makefile for your use in building and using your own Firmware.  

Once you have cloned this repository to your local system, for example:

    $ git clone https://github.com/magicshifter/MS3000.git ~/Desktop/MS3000.local && cd ~/Desktop/MS3000.local/
    
.. the next 4 basic steps to build a new image and flash it on your Magic Shifter 3000 are:

	$ make tooling
	
This will ensure that you have the tools required to build the Firmware. - i.e. the PlatformIO toolchain, React 0.14, NodeJS 5.6.

	$ make modules
	
This will make the build-product of each module.  
	
	$ make firmware

	$ make flash
	

    git clone https://github.com/magicshifter/MS3000.git MS3000.public && cd MS3000.public && git submodule init && git submodule update --recursive && make ms3kos
    
    

Contact Us
==========

We hope you will use this resource to put your Magic Shifter 3000 to great use!  Click here to let us know what you've done with your Magic Shifter 3000!

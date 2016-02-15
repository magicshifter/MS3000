
Master Repository for the MagicShifter 3000 Operating System project
====================================================================

Welcome to the MagicShifter 3000 Public Firmware release, source code repository.  

The purpose of this repository is to give you the ability to build your own Firmware for the MagicShifter 3000 hardware.

For public enquiries, i.e. non-developer information about the MagicShifter, see http://magicshifter.net/  

We hope that this resource will be of use to anyone who wants to make their MagicShifter 3000 do cool things.  We'll be helping any way we can - but we do expect that you will know what you are doing beyond this point.  RTFM, and as always: have fun!

License
-------
This Software is licensed to you under the [AGPL License.](http://www.gnu.org/licenses/agpl.html) 
Any use of this software implies agreement with this license.

Requirements
------------
We use the PlatformIO toolchain to build firmware for the MagicShifter 3000 hardware.  You must have this installed before you proceed. If you know nothing about PlatformIO, please see [PlatformIO](http://platformio.org/) and follow the installation instructions for your preferred dev platform.

Note that our system is designed to be built at the command-line - i.e. we use and support the continued use of the platformio tools at the command-line through a set of Makefiles - this makes it easier to automate building and testing.  We suggest that you feel free to use any IDE you like, once you can at least complete a command-line build first.

Description
------------
The MagicShifter Operating System is composed of some basic components that are structured independently, but are nevertheless essential to the whole: **Firmware** is the onboard OS for the MagicShifter 3000, **WebInterface** is the onboard web GUI, and **Assets** are the static resources for the user interface.  

So, this master project contains 3 sub-modules: Firmware, WebInterface and Assets. The components will be built individually and then assembled into a final package that can be flashed to your MagicShifter 3000.  

Module Facts
------------
*	Firmware: A C/C++ project, targeting the ESP8266 processor used in the MagicShifter 3000.  The entry point is src/MS3KOS.cpp.
*	WebInterface: a React-based web application designed to be served directly from the MagicShifter 3000.  
*	Assets: Static files, such as initial bitmaps and fonts, that are needed/used by either of the other components to provide functionality.

Please note: each module has its own README.md too!

Building and Using your own Firmware
------------------------------------
We provide a Makefile for your use in building and using your own Firmware.  

To get started, clone this repository to your own local directory for example:

    $ git clone https://github.com/magicshifter/MS3000.git && cd ./MS3000
    
.. the next 4 basic steps to build a new image and flash it on your MagicShifter 3000 are:

	$ make tooling
	
This will check that you have the tools required to build the Firmware. - i.e. PlatformIO and NodeJS 

	$ make modules
	
This will make the build-product of each module.  
	
	$ make firmware
	
This will package the components of the MagicShifter 3000 Operating System into a local file for your use.

	$ make flash

This will flash the firmware image to your MagicShifter 3000.
	

Contact Us
==========

We hope you will use this resource to put your MagicShifter 3000 to great use!  Click here to let us know what you've done with your MagicShifter 3000!

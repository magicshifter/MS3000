2.0-prep
Master Repository for the MagicShifter 3000 Operating System project
====================================================================

Welcome to the MagicShifter 3000 Public Firmware release, source code repository.  

We will always publish our official MagicShifter3000 firmware source releases at this repository:

https://github.com/magicshifter/MS3000

The purpose of this source release and public repository is to give you the ability to build your own Firmware for the MagicShifter 3000 hardware, from our released sources - and hopefully encourage you to contribute pull requests if you feel like it!

For public enquiries, i.e. non-developer information about the MagicShifter, see http://magicshifter.net/  

We hope that this resource will be of use to any developer who wants to make their MagicShifter 3000 do cool things and find interesting uses for it as a device.  We'll be helping any way we can - but we do expect that you will know what you are doing beyond this point.  RTFM, and as always: have fun!

License
-------
This Software is licensed to you under the [AGPL License.](http://www.gnu.org/licenses/agpl.html) 
Any use of this software implies agreement with this license.

Flashing precompiled firmware releases
-----------------------------
If you are NOT interested in building the firmware yourself and just want to flash one of our official firmware releases have a look at the instructions for this here: https://github.com/magicshifter/MS3000/wiki/FirmwareUpdate

Requirements
------------
We use the PlatformIO toolchain to build firmware for the MagicShifter 3000 hardware.  You must have this installed before you proceed. If you know nothing about PlatformIO, please see [PlatformIO](http://platformio.org/) and follow the installation instructions for your preferred dev platform.

For building the webinterface you need Node.js >=5.6.0. Please refer to the [Node.js Downloads page](https://nodejs.org/en/download/). You can also try using the Node.js version your package manager provides,
but it is very likely that this version will be too old: [Installing Node.js via package manager](https://nodejs.org/en/download/package-manager/) 

Note that our system is designed to be built at the command-line - i.e. we use and support the continued use of the platformio tools at the command-line through a set of Makefiles - this makes it easier to automate building and testing.  We suggest that you feel free to use any IDE you like, once you can at least complete a command-line build first.

Description
------------
The MagicShifter Operating System is composed of some basic components that are structured independently, but are nevertheless essential to the whole: **Firmware** is the onboard OS for the MagicShifter 3000, **WebInterface** is the onboard web GUI, and **Assets** are the static resources for the user interface.  

So, this master project contains 3 sub-modules: Firmware, WebInterface and Assets. The components will be built individually and then assembled into a final package that can be flashed to your MagicShifter 3000.  

Module Facts
------------
*	Firmware: A C/C++ project, targeting the ESP8266 processor used in the MagicShifter 3000.  The entry point is src/MS3KOS.cpp.
*	WebInterface: a React-based web application designed to be served directly from the MagicShifter 3000. This is the website you see when you visit http://magicshifter.local/ for example.
*	Assets: Static files, such as initial bitmaps and fonts, that are needed/used by either of the other components to provide functionality.

Please note: each module has its own README.md too!

Building and Using your own Firmware
------------------------------------
We provide a Makefile for your use in building and using your own Firmware.  

You can build either a) a Firmware (MS3KOS) update, or a) a complete build.

## A) To build MS3KOS on Ubuntu:

	* we get ubuntu ready:
		`apt install protobuf-compiler python-protobuf python3-pip git build-essential`

	* we install some python tools - platformio and protocol buffers:
		`pip3 install platformio python3-protobuf`

	* clone the repo:
		`git clone https://github.com/magicshifter/MS3000.git`
		`cd MS3000 && git submodule update --init --recursive`

	* set up nanopb:
		`cd MS3000-Firmware/Tools/nanopb/generator/proto && make && cd -`

	* build the MS3KOS:
		`cd MS3000-Firmware/MS3KOS/ && make`

	* at this point, new MS3KOS firmware should be on your magicShifter!

## B) To get started with a complete build, which includes the onboard Web Interface as well as a filesystem, clone this repository to your own local directory for example:

    $ git clone https://github.com/magicshifter/MS3000.git && cd ./MS3000
    
.. then, check that you have the right tools to build the firmware:

	$ make tooling

.. and then make the firmware modules:	

	$ make modules
	
This will make the build-product of each sub-module.  Note that the first time you do this, it can take a while for the independencies to install - but subsequent builds shouldn't take as long.
	
	$ make flash
	
This will install the components of the MagicShifter 3000 Operating System on your device.  Make sure your MagicShifter 3000 is plugged into your machine and turned on!

Note that if you want to give your MagicShifter 3000 a network-name other than the default ("MS3000"), you can invoke this command like this:

	$ MS3000_NAME=MyName make flash

.. where "MyName" is your name.  It should be short, sweet, and useful.

Note that if you do not want to re-flash the entire package each time, you can also use the 'make os' command to update the Firmware (OS) independently from the Assets and WebInterface.


Debugging Tools
---------------

If you want to debug the MS3K Firmware, you can use the platformio tools to gain debug info - see the "make test" target in MS3000-Firmware/MS3KOS/Makefile for example.

Contact Us
==========

We hope you will use this resource to put your MagicShifter 3000 to great use!  

Use this Issue to let us know what you're doing with yours: https://github.com/magicshifter/MS3000/issues/5 

#!/bin/bash

echo " > creating clean directories"
rm -r classes
mkdir classes
rm -r mods
mkdir mods

echo " > compiling and packaging Advent"
mkdir classes/org.codefx.demo.advent
javac \
	-d classes/org.codefx.demo.advent \
	$(find src/org.codefx.demo.advent -name '*.java')
jar \
	-c \
	--file mods/org.codefx.demo.advent.jar \
	--main-class=org.codefx.demo.advent.Main \
	-C classes/org.codefx.demo.advent/ .

echo " > running Advent"
java \
	-p mods \
	-m org.codefx.demo.advent

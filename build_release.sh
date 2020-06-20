#!/bin/bash

function usage()
{
  printf "%s\n" "$0 <release version tag>"
  printf "\t%s\n" "<release version tag> = A Release Tag, such as v0.9.7-RC2 or v1.2.6"
  printf "\t%s\n" "This will create a directory 'issSpellStates_<release tag>'"  
}

if [[ ("$1" == "") || ( "$1" == "help" ) ]]; then
	usage
	exit 1
fi

RELEASEVER=$1
RELEASEDIR="${HOME}/issSpellStates"

if [[ -d ${RELEASEDIR} ]]; then
	printf "%s\n" "ERROR: Release Directory already exists.  Please clean up after the prior release and run again."
	exit 1
fi

mkdir ${RELEASEDIR}
if [[ ! -d ${RELEASEDIR} ]]; then
  printf "%s\n" "Error Creating Release Directory."
  exit 1
fi

cp Lib_issSpellStates.rptok ${RELEASEDIR}
cp image_GreenBubbleCheck.rptok ${RELEASEDIR}
cp image_RedBubbleX.rptok ${RELEASEDIR}
cp issSpellStates_Base.cmpgn ${RELEASEDIR}
cp User_Manual.txt ${RELEASEDIR}
cp Using_issSpellStates_by_Example.txt ${RELEASEDIR}
cp -aR 5e/ ${RELEASEDIR}

# Create the Release File
cd ..
CURRENTDIR=`pwd`
cd ${HOME}
zip -r issSpellStates_${RELEASEVER}.zip issSpellStates/*
mv issSpellStates_${RELEASEVER}.zip ${CURRENTDIR}

CREATEDARCHIVE="${CURRENTDIR}/issSpellStates_${RELEASEVER}.zip"
printf "%s\n" "Archive ${CREATEDARCHIVE} Created."

# Clean Up
if [[ -f ${CREATEDARCHIVE} ]]; then
	rm -rf ${RELEASEDIR}
fi
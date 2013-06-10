#!/bin/bash
#set -x

source VIMI_Func.sh

cd Sources
if [[ $# -eq 1 ]]; then
	SOURCEFILE=$1".cpp"
	INPUTFILE=$1".in"
	OUTPUTFILE=$1".out"
	PROBNAME=$1

	PARAM1=$(tolower $1)

	if [ "$PARAM1" == "-backup" ] || [ "$PARAM1" == "-b" ] ; then
		backup
	elif [ "$PARAM1" == "-help" ] || [ "$PARAM1" == "-h" ] ; then
		display_help
	else
		if [[ ! -f $SOURCEFILE ]]; then
			new_IA $SOURCEFILE $INPUTFILE $OUTPUTFILE $PROBNAME
		fi

		open $SOURCEFILE $INPUTFILE $OUTPUTFILE
	fi
elif [[ $# -eq 2 ]]; then
	SOURCEFILE=$2".cpp"
	INPUTFILE=$2".in"
	OUTPUTFILE=$2".out"
	PROBNAME=$2

	PARAM1=$(tolower $1)
	PARAM2=$(tolower $2)

	if [ "$PARAM1" == "-new" ] || [ "$PARAM1" == "-n" ] ; then
		new_IA $SOURCEFILE $INPUTFILE $OUTPUTFILE $PROBNAME
		open $SOURCEFILE $INPUTFILE $OUTPUTFILE 
	elif [ "$PARAM1" == "-newcf" ] || [ "$PARAM1" == "-ncf" ] ; then
		new_CF $SOURCEFILE $INPUTFILE $OUTPUTFILE $PROBNAME
		open $SOURCEFILE $INPUTFILE $OUTPUTFILE
	elif [ "$PARAM1" == "-open" ] || [ "$PARAM1" == "-o" ] ; then
		open $SOURCEFILE $INPUTFILE $OUTPUTFILE
	elif ([ "$PARAM1" == "-clean" ] || [ "$PARAM1" == "-c" ]) && [ "$PARAM2" == "-all" ] ; then
		clean_all
	elif ([ "$PARAM1" == "-delete" ] || [ "$PARAM1" == "-d" ]) && [ "$PARAM2" == "-all" ] ; then
		delete_all
	elif ([ "$PARAM1" == "-ioclean" ] || [ "$PARAM1" == "-ioc" ]) && [ "$PARAM2" == "-all" ] ; then
		clean_inout_all
	elif [ "$PARAM1" == "-clean" ] || [ "$PARAM1" == "-c" ] ; then
		clean $2
	elif [ "$PARAM1" == "-delete" ] || [ "$PARAM1" == "-d" ] ; then
		delete $2
	elif [ "$PARAM1" == "-ioclean" ] || [ "$PARAM1" == "-ioc" ] ; then
		clean_inout $2
	else
		echo "Invalid command"
		exit 1
	fi
else
	sudo vim -S ../vimrc
fi


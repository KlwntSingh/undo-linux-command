#!/bin/bash
#ls
echo "kulwant singh created the script"
echo $1
echo $#
comm=$1
if [ $1 = 'sudo' ]; then
	comm=$2
	sudo_status=1;
fi
copyCommandUndo ()
{
	echo $1
	echo $2
	echo $3
	echo $4
	if [ $sudo_status = 1 ]; then

		if [ $# = 5 ]; then
			#	$3 need to be replaced by filename not whole input third argument 
			if [ -d $5 ]; then
				dest=$5/$3
			else
				dest=$5
			fi
		else
		#	$3 need to be replaced by filename not whole input third argument 
			if [ -d $4 ]; then
				dest=$4/$3
			else
				dest=$4
			fi
			echo $dest
		fi
		echo $dest
	else
		if [ $# = 5 ]; then
			#	$3 need to be replaced by filename not whole input third argument 
			if [ -d $4 ]; then
				dest=$4/$3
			else
				dest=$4
			fi
		else
		#	$3 need to be replaced by filename not whole input third argument 
			if [ -d $3 ]; then
				dest=$3/$2
			else
				dest=$3
			fi
		fi
	fi
}

moveCommandUndo ()
{
	if [ $sudo_status = 1 ]; then
		dest=$4
		sourc=$3
	else
		dest=$3
		sourc=$2
	fi
}

if [ $comm = "cp" ]; then
	if [ $# = 4 ];then
		copyCommandUndo $1 $2 $3 $4
	elif [ $# = 5 ]; then
		copyCommandUndo $1 $2 $3 $4 $5
	fi
	echo $dest
	rm -rf $dest
fi

if [ $comm = "mv" ]; then
	if [ $# = 3 ];then
		moveCommandUndo $1 $2 $3
		echo $dest
		mv $dest $sourc
	elif [ $# = 4 ];then
		moveCommandUndo $1 $2 $3 $4
		echo $dest
		mv $dest $sourc
	elif [ $# = 5 ]; then
		moveCommandUndo $1 $2 $4 $5
		mv $3 $dest $sourc
	fi	
fi

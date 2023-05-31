#! /bin/bash

RES_X=50
RES_Y=20

if [ $# -eq 2 ]
then
	echo "put anything! not gonna stop you : )"
	sleep 0.5
	RES_X=$1
	RES_Y=$2
elif [ $# -ne 0 ]
then
	echo "Invalid number of arguments ( no fun today >:) )"
	exit 0
fi

VEL_X=1
VEL_Y=1
POS_X=$(( $RES_X / 2 ))
POS_Y=$(( $RES_Y / 2 ))

while [ 1 ]
do
	clear
	#echo $POS_X
	#echo $POS_Y
	INC_J=-1
	while [ $INC_J -lt $(( $RES_Y + 1 )) ]
	do
		INC_I=-1
		while [ $INC_I -lt $(( RES_X + 1 )) ]
		do
			if [ $INC_I -eq $POS_X  ] && [ $INC_J -eq $POS_Y ]
			then
				printf "O"
			elif [ $INC_I -eq -1 ] || [ $INC_I -eq $RES_X ] || [ $INC_J -eq $RES_Y ] || [ $INC_J -eq -1 ]
			then
				printf "#"
			else
				printf " "
			fi
			INC_I=$(( $INC_I + 1 ))
		done
		printf "\n"
		INC_J=$(( $INC_J + 1 ))
	done
	# echo $#
	sleep 0.2
	if [ $POS_X -ge $(( $RES_X - 1 ))  ] || [ $POS_X -le 0 ]
	then
		VEL_X=$(( $VEL_X * -1 ))
	fi
	if [ $POS_Y -ge $(( $RES_Y - 1 )) ] || [ $POS_Y -le 0 ]
	then
		VEL_Y=$(( $VEL_Y * -1 ))
	fi
	POS_X=$(( $POS_X + $VEL_X ))
	POS_Y=$(( $POS_Y + $VEL_Y ))
done

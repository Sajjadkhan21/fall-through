#!/bin/bash

case ${1,,} in
	safiullah | SAFIULLAH)
		echo "you are my friend, $1 ":
		echo "Your name for entry is : $1"
	;;
	help)
		echo "you are anonymous to me, $1"
	;;
	*)
		echo "sorry! $1"
esac
		

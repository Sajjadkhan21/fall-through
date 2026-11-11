#!/bin/bash

case $1 in
	1) echo "one" ;&
	2) echo "two (falls through from one if matched at 1)";&
	*3) echo "anything with 3 in the last" ;;
	*) echo "no option" ;;
esac

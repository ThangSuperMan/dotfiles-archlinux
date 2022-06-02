#!/bin/bash

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
	ibus engine 'Bamboo::Candy'
else
	ibus engine 'xkb:us::eng'

	# Reload the keybinding for keyboard
	xmodmap ~/.Xmodmap
fi

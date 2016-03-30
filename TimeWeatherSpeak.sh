#!/bin/bash

curr_weather="$(weather "<insert city here>" | awk 'NR==5' | cut -c 23-24)"
curr_time="$(date +'%l:%M')"
ampm="$(date +'%p')"
curr_time+=$ampm
text='The time is'
espeak -a 50 --stdout 'The time is' | aplay
espeak -a 50 --stdout $curr_time | aplay
espeak -a 50 --stdout 'with a temperature of' | aplay
espeak -a 50 --stdout $curr_weather"degrees" | aplay

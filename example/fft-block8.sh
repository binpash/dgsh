#!bin/bash

export DGSH_DOT_DRAW="$(basename $0 .sh)"

fft-input $1 |
tee -p 1,5,3,7,2,6,4,8 |
{{
	{{
		w 1 0 &
		w 1 0 &
	}} |
	tee -p 1,3,2,4 |
	{{
		w 2 0 &
		w 2 1 &
	}} &

	{{
		w 1 0 &
		w 1 0 &
	}} |
	tee -p 1,3,2,4 |
	{{
		w 2 0 &
		w 2 1 &
	}} &
}} |
tee -p 1,5,3,7,2,6,4,8 |
{{
	w 3 0 &

	w 3 1 &

	w 3 2 &

	w 3 3 &
}} |
tee -p 1,5,2,6,3,7,4,8 |
cat

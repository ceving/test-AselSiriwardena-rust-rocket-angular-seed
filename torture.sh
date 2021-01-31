#! /bin/bash

export LC_ALL=C
exec 3>&1
exec 1>log
exec 2>&1
set -eux

timestamp () { date +%s.%N; }

: ${LOOPS:=1000}
t0=$(timestamp)
for n in $(seq "$LOOPS")
do
  "$@" &
done
wait
t1=$(timestamp)

printf '%d loops: %0.4f seconds\n' "$LOOPS" "$(bc <<< "$t1 - $t0")" >&3

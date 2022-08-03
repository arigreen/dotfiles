#!/bin/sh

tee "/tmp/ale_$1.in" | "$@" 2>"/tmp/ale_$1.err" | tee "/tmp/ale_$1.out"

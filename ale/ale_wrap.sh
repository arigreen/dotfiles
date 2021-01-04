#!/bin/sh

tee "/tmp/ale/$1.in" | "$@" 2>"/tmp/ale/$1.err" | tee "/tmp/ale/$1.out"

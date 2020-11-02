#!/bin/sh -l

echo "Come on...work"
echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
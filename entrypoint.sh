#!/bin/sh -1

echo "Come on..."
echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
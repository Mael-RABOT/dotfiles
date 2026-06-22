#!/usr/bin/env bash

top -bn1 | awk '/Cpu/ {print "CPU " int($2) "%"}'
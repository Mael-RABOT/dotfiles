#!/usr/bin/env bash

free -h | awk '/Mem:/ {print "RAM " $3 "/" $2}'
#!/bin/sh

updates=$(checkupdates-with-aur | wc -l)

echo "$updates"
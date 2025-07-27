#!/bin/sh

updates=$(yay -Qu | wc -l)

echo "$updates"
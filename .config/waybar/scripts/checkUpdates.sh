#!/bin/bash

# Definição dos limites para as cores
threshhold_green=0
threshhold_blue=10
threshhold_yellow=25
threshhold_red=100

updates=$(yay -Qu | wc -l)

# Define a cor baseada no número de atualizações


if [ "$updates" -ge $threshhold_green ]; then
    css_class="green"
fi

if [ "$updates" -ge $threshhold_blue ]; then
    css_class="blue"
fi

if [ "$updates" -ge $threshhold_yellow ]; then
    css_class="yellow"
fi

if [ "$updates" -ge $threshhold_red ]; then
    css_class="red"
fi

# Formata a saída em JSON
printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
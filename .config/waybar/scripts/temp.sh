#!/bin/sh
# sensors | grep 'Tctl' | awk '{print $2}' | sed 's/+//'


# Extrai a temperatura, remove o símbolo de grau Celsius e o sinal de mais
temp=$(sensors | grep 'Tctl' | awk '{print $2}' | tr -d '°C+')

# Usa awk para extrair a parte inteira e decimal da temperatura
temp_parts=($(echo "$temp" | awk -F"." '{print $1,$2}'))

# Concatena a parte inteira com a decimal para manter a precisão
temp_float="${temp_parts[0]}.${temp_parts[1]}"

# Verifica a temperatura e atribui a variável class o valor correspondente
if (( $(echo "$temp_float < 40" | bc -l) )); then
    class="low"
elif (( $(echo "$temp_float >= 40 && $temp_float <= 60" | bc -l) )); then
    class="medium"
else
    class="high"
fi

# Imprime a variável class e a temperatura para fins de teste
printf '{"text": "%s°C", "alt": "%s", "class": "%s"}' "$temp_float" "$class" "$class"

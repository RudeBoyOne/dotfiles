#!/bin/bash

API_KEY="50ab75eb"
CITY="SaoPaulo,SP"

RESPONSE="$(curl -fsS --get "https://api.hgbrasil.com/weather" \
  --data-urlencode "key=${API_KEY}" \
  --data-urlencode "city_name=${CITY}" 2>/dev/null || true)"

if [[ -z "$RESPONSE" ]] || [[ "$(jq -r '.valid_key // false' <<<"$RESPONSE")" != "true" ]]; then
  echo '{"text":" --","tooltip":"Chave inválida, cidade não encontrada ou sem rede."}'
  exit 0
fi

TEMP="$(jq -r '.results.temp // "--"' <<<"$RESPONSE")"
CITY_NAME="$(jq -r '.results.city // ""' <<<"$RESPONSE")"
DESCRIPTION="$(jq -r '.results.description // ""' <<<"$RESPONSE")"
HUMIDITY="$(jq -r '.results.humidity // 0' <<<"$RESPONSE")"
CLOUDINESS="$(jq -r '.results.cloudiness // 0' <<<"$RESPONSE")"
CONDITION_SLUG="$(jq -r '.results.condition_slug // "none_day"' <<<"$RESPONSE")"
MAX_TEMP="$(jq -r '.results.forecast[0].max // "--"' <<<"$RESPONSE")"
MIN_TEMP="$(jq -r '.results.forecast[0].min // "--"' <<<"$RESPONSE")"

# Mapeamento de ícones Nerd Font
case "$CONDITION_SLUG" in
storm) ICON="   " ;;
snow) ICON="   " ;;
hail) ICON="  " ;;
rain) ICON="  " ;;
fog) ICON=" 󰖑 " ;;
clear_day) ICON="  " ;;
clear_night) ICON=" 󰖔 " ;;
cloud) ICON="   " ;;
cloudly_day) ICON="  " ;;
cloudly_night) ICON="  " ;;
none_day) ICON="  " ;;
none_night) ICON="  " ;;
*) ICON="?" ;;
esac

TOOLTIP="${CITY_NAME}\n${DESCRIPTION}\nUmidade:  ${HUMIDITY}%\nNebulosidade:   ${CLOUDINESS}%\nMín:  ${MIN_TEMP}° | Máx:  ${MAX_TEMP}°"

echo "{\"text\":\"${ICON} ${TEMP}\",\"tooltip\":\"${TOOLTIP}\"}"

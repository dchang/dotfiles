#!/bin/sh

pwifi() {
  echo " $(iw dev | grep ssid | awk '{print $2}')"
}

pvol() {
  echo " $(amixer get Master | awk -F'[][]' 'END{print $2}')"
}

pbat() {
  icons=('' '' '' '' '' '')
  re=': (\w*), (.*)%,' 
  [[ `acpi` =~ $re ]]
  [[ ${BASH_REMATCH[1]} = 'Charging' ]] && icon='' || icon=${icons[BASH_REMATCH[2] / 20]}
  echo "${icon} ${BASH_REMATCH[2]}%"
}

pdate() {
  echo " $(date '+%a %b %e %k:%M')"
}

while :; do
  xsetroot -name "$(pwifi)  $(pvol)  $(pbat)  $(pdate)"
  sleep 1
done


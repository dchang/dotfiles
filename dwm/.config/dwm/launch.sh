#!/bin/sh

pwifi() {
  echo " $(iw dev | grep ssid | awk '{print $2}')"
}

pbat() {
  echo " $(acpi | grep -Po '\d+%')"
}

pvol() {
  echo " $(amixer get Master | awk -F'[][]' 'END{print $2}')"
}

pdate() {
  echo " $(date '+%a %b %e %k:%M')"
}

while :; do
  xsetroot -name "$(pwifi)  $(pbat)  $(pvol)  $(pdate)"
  sleep 1
done


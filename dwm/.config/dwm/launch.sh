#!/bin/sh

pwifi() {
  ssid=$(iw dev | grep ssid | awk '{print $2}')
  if [ -z ${ssid} ]; then echo " Disconnected"; else echo " ${ssid}"; fi
}

pvol() {
  read vol mute <<< $(amixer get Master | awk -F'[][]' 'END{print $2" "$6}')
  [[ $mute = 'on' ]] && icon='' || icon=''
  echo "$icon $vol"
}

pbat() {
  icons=''
  re=': (\w*), (.*)%' 
  [[ $(acpi) =~ $re ]]
  [[ ${BASH_REMATCH[1]} = 'Discharging' ]] && icon=${icons:BASH_REMATCH[2] / 20:1} || icon=''
  echo "${icon} ${BASH_REMATCH[2]}%"
}

pdate() {
  echo " $(date '+%a %b %e %k:%M')"
}

while :; do
  xsetroot -name "$(pwifi)  $(pvol)  $(pbat)  $(pdate)"
  sleep 1
done


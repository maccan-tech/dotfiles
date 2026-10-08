#!/usr/bin/env bash

#// Check if wlogout is already running

if pgrep -x "wlogout" >/dev/null; then
    pkill -x "wlogout"
    exit 0
fi

#// set file variables

scrDir=$(dirname "$(realpath "$0")")
# shellcheck disable=SC1091
source "$scrDir/globalcontrol.sh"
[ -n "${1}" ] && wlogoutStyle="${1}"
wlogoutStyle=${wlogoutStyle:-$WLOGOUT_STYLE}
confDir="${confDir:-$HOME/.config}"
wLayout="${confDir}/wlogout/layout_${wlogoutStyle}"
wlTmplt="${confDir}/wlogout/style_${wlogoutStyle}.css"
echo "wlogoutStyle: ${wlogoutStyle}"
echo "wLayout: ${wLayout}"
echo "wlTmplt: ${wlTmplt}"

if [ ! -f "${wLayout}" ] || [ ! -f "${wlTmplt}" ]; then
    echo "ERROR: Config ${wlogoutStyle} not found..."
    wlogoutStyle=1
    wLayout="${confDir}/wlogout/layout_${wlogoutStyle}"
    wlTmplt="${confDir}/wlogout/style_${wlogoutStyle}.css"
fi

#// detect monitor res

x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
# Scale as a percentage (1.25 -> 125). Computed in jq because newer Hyprland
# prints whole scales as "1" instead of "1.00", which broke stripping the dot
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale * 100 | round')
#// scale config layout and style

case "${wlogoutStyle}" in
1)
    wlColms=6
    export mgn=$((y_mon * 28 / hypr_scale))
    export hvr=$((y_mon * 23 / hypr_scale))
    ;;
2)
    # Centered 2x2 block of cards touching each other. Each card has a margin
    # of ${inset} on its two outer sides only; hover drops that margin and adds
    # it to min-width/min-height, so the card grows outwards while its cell
    # (and therefore the neighbouring cards) stays put
    wlColms=2
    x_log=$((x_mon * 100 / hypr_scale))
    y_log=$((y_mon * 100 / hypr_scale))
    card=$((y_log * 20 / 100))
    border=2
    export inset=16
    export radius=24
    # min-width/min-height exclude the border
    export card_min=$((card - 2 * border))
    export hvr_card_min=$((card_min + inset))
    cell=$((card + inset))
    side=$(((x_log - wlColms * cell) / 2))
    vert=$(((y_log - 2 * cell) / 2))
    wlSpacing=(-c 0 -r 0 -L "${side}" -R "${side}" -T "${vert}" -B "${vert}")
    ;;
esac
[ "${#wlSpacing[@]}" -eq 0 ] && wlSpacing=(-c 0 -r 0 -m 0)

#// scale font size

export fntSize=$((y_mon * 2 / 100))

#// detect wallpaper brightness

cacheDir="${HYDE_CACHE_HOME}"
dcol_mode="${dcol_mode:-dark}"
# shellcheck disable=SC1091
[ -f "${cacheDir}/wall.dcol" ] && source "${cacheDir}/wall.dcol"

#  Theme mode: detects the color-scheme set in hypr.theme and falls back if nothing is parsed.
enableWallDcol="${enableWallDcol:-1}"
if [ "${enableWallDcol}" -eq 0 ]; then
    HYDE_THEME_DIR="${HYDE_THEME_DIR:-$confDir/hyde/themes/$HYDE_THEME}"
    dcol_mode=$(get_hyprConf "COLOR_SCHEME")
    dcol_mode=${dcol_mode#prefer-}
    # shellcheck disable=SC1091
    [ -f "${HYDE_THEME_DIR}/theme.dcol" ] && source "${HYDE_THEME_DIR}/theme.dcol"
fi
{ [ "${dcol_mode}" == "dark" ] && export BtnCol="white"; } || export BtnCol="black"

#// eval hypr border radius

hypr_border="${hypr_border:-10}"
export active_rad=$((hypr_border * 5))
export button_rad=$((hypr_border * 8))

#// eval config files

wlStyle="$(envsubst <"${wlTmplt}")"

#// launch wlogout

wlogout -b "${wlColms}" "${wlSpacing[@]}" --layout "${wLayout}" --css <(echo "${wlStyle}") --protocol layer-shell

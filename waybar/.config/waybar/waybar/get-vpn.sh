connect="activ"
home_vpn=$(nmcli -f GENERAL.STATE con show Home)
tailscale=$(tailscale status --active)
nord=$(nordvpn status)

if [[ $tailscale == *"brush"* ]]; then
    printf '{"text": "Tailscale", "alt": "connected"}\n'
elif [[ $home_vpn == *"activated"* ]]; then
    printf '{"text": "Home VPN", "alt": "connected"}\n'
elif [[ $nord == *"Connected"* ]]; then
    printf '{"text": "NordVPN", "alt": "connected"}\n'
else
    printf '{"text": "No VPN", "alt": "disconnected"}\n'
fi

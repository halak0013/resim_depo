nmcli dev set wlan0 managed no

IP_ADDR=192.160.0.1
IFACE=wlan0
MESH_ID="ehlikesf-test-agi"
FREQUENCY=2412
FREQ_BAND=HT20
MESH_MAC="00:11:22:33:44:55"
SUBNET="24"
BRIDGE_IFACE="mesh-bridge"
BATMAN_IFACE="bat0"

iw dev $IFACE set type ibss
ip link set up mtu 1500 dev $IFACE
iw dev $IFACE ibss join $MESH_ID $FREQUENCY  fixed-freq $MESH_MAC


batctl if add $IFACE
ip link set up dev $BATMAN_IFACE
ip addr add "${IP_ADDR}/${SUBNET}" dev $BATMAN_IFACE




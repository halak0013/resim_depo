echo "ag ayarlari kapaniyor"
nmcli dev set wlan0 managed no
sleep 5

IP_ADDR=192.160.0.1
IFACE=wlan0
MESH_ID="ehlikesf-test-agi"
FREQUENCY=2412
FREQ_BAND=HT20
MESH_MAC="00:11:22:33:44:55"
SUBNET="24"
BRIDGE_IFACE="mesh-bridge"
BATMAN_IFACE="bat0"

echo "ibss ayarlaniyor"
iw dev $IFACE set type ibss
sleep 5

echo "mtu ayaralniyor"
ip link set up mtu 1500 dev $IFACE
sleep 5

echo "ibss agi olusturuluyor"
iw dev $IFACE ibss join $MESH_ID $FREQUENCY  fixed-freq $MESH_MAC
sleep 5

echo "batctl'ye ekleniyor"
batctl if add $IFACE
sleep 5

echo "bat0 ayarlaniyor"
ip link set up dev $BATMAN_IFACE
sleep 5

echo "ip atamasi yapılıyor"
ip addr add "${IP_ADDR}/${SUBNET}" dev $BATMAN_IFACE




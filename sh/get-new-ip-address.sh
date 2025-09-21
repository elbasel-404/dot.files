IFACE="wlp0s20f3"
MAC="02$(hexdump -n5 -e '/1 ":%02X"' /dev/urandom)"

echo "Changing MAC of $IFACE to $MAC"
sudo ip link set dev "$IFACE" down
sudo ip link set dev "$IFACE" address "$MAC"
sudo ip link set dev "$IFACE" up

#sudo nmcli device disconnect "$IFACE"
#sudo nmcli device connect "$IFACE"
echo "New interface info:"
#ip addr show "$IFACE" | grep -E "inet |link/ether"
ip addr show "$IFACE"

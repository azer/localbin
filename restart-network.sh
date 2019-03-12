echo "Restarting network"

modprobe -r brcmfmac
modprobe brcmfmac
systemctl restart NetworkManager

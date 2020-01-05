


# connect to synology within network with /etc/fstab
jace-cloud.local:/volumeUSB1/usbshare	/home/jace/Jace_Docs	nfs	nfsvers=4.1,defaults,comment=systemd.automount	0 0

# /etc/fstab
jace-cloud:/volumeUSB1/usbshare	/home/jace/Jace_Docs	nfs	defaults,async,auto,dev,exec,suid,rw,_netdev,iversion,comment=systemd.automount	0 0
jace-cloud:/volume1/NAS_Documents	/home/jace/NAS_Documents	nfs	defaults,async,auto,dev,exec,suid,rw,_netdev,iversion,comment=systemd.automount	0 0
jace-cloud:/volumeUSB1/usbshare	/home/jace/Jace_Docs	nfs	defaults,async,auto,dev,exec,suid,rw,_netdev,iversion,comment=systemd.automount	0 0

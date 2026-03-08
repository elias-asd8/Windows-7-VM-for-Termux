# install pd
pkg install pd

#install Ubuntu in pd
pd install Ubuntu

#login Ubuntu 
pd login Ubuntu

#install essentials
apt install aria2 && apt install qemu-utils && apt install tigervnc

#install windows 7 Ultimate
aria2c -x 16 -s 16 "https://archive.org/download/microsoft-windows-7-ultimate-with-service-pack-1-64-bit/Microsoft%20Windows%207%20Ultimate%20with%20Service%20Pack%201%20%2864-bit%29.iso" -o win7.iso

#create a hda
qemu-img create -f qcow2 win7.qcow2 40G

#run the vm
qemu-system-x86_64 \
  -m 2048 \
  -cpu max \
  -smp 2 \
  -hda ~/win7.qcow2 \
  -cdrom ~/win7.iso \
  -boot d \
  -vga std \
  -device virtio-net,netdev=net0 \
  -netdev user,id=net0 \
  -usb \
  -device usb-tablet \
  -rtc base=localtime \
  -display vnc=:1

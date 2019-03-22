eMMC Multiboot helper <br />
<br />
The multiboot supports one Android and 4x Enigma2/Linux image <br />
The multiboot supports USB update <br />
The multiboot supports online image update with only wired ethernet cable. So it's not possible by wifi. <br />
<br />
Access multiboot <br />
There are a couple of ways to access the multiboot menu <br />
1. Press and hold a remote key while the receiver boot/starts. <br />
2. Copy the file STARTUP_RECOVERY from the partition block /dev/mmcblk0p4 and save it as STARTUP or STARTUP_ONCE <br />
3. When the box has a STANDBY button on the frontpanel press and hold it while the receiver boot/starts. <br />
<br />
<br />
CAREFULL only use this option when it's necessary. <br />
The receiver can been update without select an image. <br />
In the image zip you can move the file unforce_"machine".txt to the root of your usb disk and rename it to force_"machine".txt <br />
The file force_"machine".txt should contain the zip filename which you want to install. This image will automatically be installed if you enter the Multiboot. <br />
When the zip file has the right structure it will be installed in the first linux partition. <br />
<br />
Expert <br />
It's possible to add extra image by manually add startup lines like STARTUP_LINUX_5, STARTUP_LINUX_6 <br />
Copy STARTUP_LINUX_1, 2, 3 or 4 to STARTUP_LINUX_5, 6 etc, and modify the 'rootsubdir' option in the bootargs. <br />
The kernel will be shared with the linux 1, 2, 3 or 4 image, depending on which startup file you copied. <br />
<br />
<br />


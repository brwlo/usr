# linux/arch/install2.sh

# first
. /root/vars.sh
set -o vi

# config
ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc

sed -i 's/#(en_US.UTF-8 UTF-8)/\1/' /etc/locale.gen
sed -i 's/#(pt_BR.UTF-8 UTF-8)/\1/' /etc/locale.gen
sed -i 's/#(uk_UA.UTF-8 UTF-8)/\1/' /etc/locale.gen
locale-gen

echo KEYMAP=br-abnt2  > /etc/vconsole.conf
echo LANG=en_US.UTF-8 > /etc/locale.conf

read -p 'host name: -- ' host
echo $host > /etc/hostname
cat <<-E > /etc/hosts
		      ::1 localhost
		127.0.0.1 localhost
		127.0.1.1 $host.localdomain $host
	E

# hooks
[ $rem ] && hooks="base udev block keyboard autodetect modconf filesystems fsck"
[ $rem ] && sed -i "/^HOO/cHOOKS=($hooks)" /etc/mkinitcpio.conf

# boot
[ $rem  ] && opt='--recheck --removable --efi-directory=/boot'
[ $uefi ] && grub-install --target=x86_64-efi --bootloader-id=grub $opt
[ $bios ] && grub-install --target=i386-pc /dev/$drv
grub-mkconfig -o /boot/grub/grub.cfg

# users
passwd
read -p 'user name: ' user
useradd -m $user
passwd $user
sed '/##### my conf/d'
echo -e "$user ALL=(ALL) ALL ##### my conf" >> /etc/sudoers

# services
systemctl enable NetworkManager.service

# final
[ $emu ] && rsync -av --exclude emulations bw@10.0.2.2:~/u/{a,c,v,w} mnt/bw
#[ $dsk ] && rsync -av --exclude emulations ...
#[ $rem ] && rsync -av --exclude emulations ...
ln -sf /mnt/bw /{root,home/$user}
echo '. ~/bw/c/bash/rc' | tee /{root,home/$user}/.bash_profile
rm /{root,home/$user}/.bashrc
rm {vars,install*}.sh
echo END

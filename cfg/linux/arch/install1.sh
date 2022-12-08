# linux/arch/install1.sh

# TODO
# - make less interactive
# - how to set mbr bios boot type on partition?
# - how to copy my files to partition on dsk and rem?
# - change color of grub menu
# - use persistent block name in $rem
# - what else?

# NOTE
# Previously, if I had no wifi connection,
# this code was needed:
# loadkeys br-abnt2
# echo "nameserver 8.8."{8.8,4.4}"\n" >> /etc/resolv.conf
# ip link set dev wlp1s0 up
# wpa_supplicant -B -i wlp1s0 -c<(wpa_passphrase "gaspa" "eporofrost")
# ip addr add 192.168.0.10/24 broadcast 192.168.0.255 dev wlp1s0
# ip route add default via 192.168.0.1

# setup
read -p 'drive (eg. sdX)  :                 -- ' drv
read -p 'install type     : dsk,  emu,  rem -- ' ins; eval $ins=1
read -p 'medium (eg. live): live,  dead     -- ' med; eval $med=1
[ -d /sys/firmware/efi/efivars ] && uefi=1 || bios=1

[ $live ] && loadkeys br-abnt2; set -o vi
[ $live ] && timedatectl set-ntp true

# partition
cfdisk /dev/$drv
read -p 'efi  partition number: -- ' efi
read -p 'root partition number: -- ' root
read -p 'data partition number: -- ' data
read -p 'swap partition number: -- ' swap
devs="/dev/disk/by-partuuid"
[ $efi  ] && efi="$devs/$(lsblk  -dno PARTUUID /dev/$drv$efi)"
[ $root ] && root="$devs/$(lsblk -dno PARTUUID /dev/$drv$root)"
[ $data ] && data="$devs/$(lsblk -dno PARTUUID /dev/$drv$data)"
[ $swap ] && swap="$devs/$(lsblk -dno PARTUUID /dev/$drv$swap)"

# format
[ $rem  ] && opts='-O "^has_journal"'
[ $efi  ] && mkfs.vfat $efi
[ $bios ] # ---------- how to set to type mbr and bootable if $bios==1
[ $data ] && mkfs.ext4 $opts $data
[ $swap ] && mkswap $swap && swapon $swap
mkfs.ext4 $opts $root

# mount
dir="/mnt/dir"
mkdir -p $dir/{boot,mnt}
mount $root $dir
[ $efi  ] && mount $efi  $dir/boot
[ $data ] && mount $data $dir/mnt

# install
pacstrap $dir --needed \
	base base-devel linux linux-firmware     \
	grub os-prober intel-ucode efibootmgr    \
	sudo binutils findutils openssh rsync    \
	neovim mutt ranger qutebrowser i3 dmenu  \
	zathura zathura-{cb,djvu,pdf-poppler,ps} \
	xorg xorg-{apps,server,xrandr,xinit}     \
	xterm xclip arandr xcompmgr rxvt-unicode \
	qemu qemu-{arch-extra,block-iscsi} bc    \
  ffmpeg mpv npm feh sxiv git libeatmydata \
	r gs fzy fzf iw networkmanager samba     \
	alsa-utils alsa-plugins pulseaudio       \
	bdf-unifont cantarell-fonts fluidsynth fontconfig                                 \
	freetype2 gnu-free-fonts gsfonts libfontenc libotf libxfont2 libxft t1lib         \
	texlive-fontsextra texlive-langchinese texlive-langcyrillic texlive-langgreek     \
	texlive-langjapanese texlive-langkorean ttf-dejavu woff2 xorg-bdftopcf            \
	xorg-font-util xorg-fonts-100dpi xorg-fonts-75dpi xorg-fonts-alias-100dpi         \
	xorg-fonts-alias-75dpi xorg-fonts-alias-misc xorg-fonts-encodings xorg-fonts-misc \
	xorg-fonts-type1 xorg-mkfontscale xorg-xfontsel gentium-plus-font terminus-font   \
	ttf-droid ttf-inconsolata ttf-junicode ttf-liberation libertinus-font             #

genfstab -U /mnt >> /mnt/etc/fstab

# chroot
cp ./* $dir/root
cat <<E >$dir/root/vars.sh
drv=$drv efi=$efi root=$root data=$data swap=$swap
opts=$opts ins=$ins med=$med uefi=$uefi bios=$bios
dir=$dir
E
read -p "run install2.sh, ok?"
arch-chroot $dir

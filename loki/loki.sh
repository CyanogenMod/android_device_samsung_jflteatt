#!/sbin/sh
#
# This leverages the loki_patch utility created by djrbliss which allows us
# to bypass the bootloader checks on jfltevzw and jflteatt
# See here for more information on loki: https://github.com/djrbliss/loki
#
#
# Run loki patch on boot images with certain bootloaders
#
# Valid:
# Bootloader Version I337UCUAMDB (AT&T)
# Bootloader Version I337UCUAMDL (AT&T)
# Bootloader Version I545VRUAMDK (Verizon)

cat /proc/cmdline|egrep -q '(bootloader=I337UCUAMDB)|(bootloader=I337UCUAMDL)|(bootloader=I545VRUAMDK)'
if [ $? = 0 ];
    then
       cd /tmp
       chmod 777 loki_patch
       dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=aboot.img
       ./loki_patch boot aboot.img boot.img boot.lok
        dd if=/tmp/boot.lok of=/dev/block/platform/msm_sdcc.1/by-name/boot

# cleanup
       rm /system/bin/loki.sh
       rm /system/bin/loki_patch

fi





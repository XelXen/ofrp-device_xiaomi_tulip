#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2018-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

FDEVICE="tulip"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	# -- Exporting vars --
	export TARGET_ARCH=arm64
	export OF_AB_DEVICE=0
	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_USE_TAR_BINARY=1
	export FOX_ASH_IS_BASH=1
	export OF_USE_MAGISKBOOT=1
	export OF_KEEP_DM_VERITY=1
	export FOX_USE_SPECIFIC_MAGISK_ZIP="./device/xiaomi/tulip/misc/Magisk.zip"
	export FOX_VARIANT=GalacticStar
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_XZ_UTILS=1
	export FOX_DELETE_INITD_ADDON=1
	export OF_REPORT_HARMLESS_MOUNT_ISSUES=1
	export OF_DISABLE_EXTRA_ABOUT_PAGE=1
	export OF_NO_SAMSUNG_SPECIAL=1
	export FOX_ADVANCED_SECURITY=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
	export OF_PATCH_AVB20=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export OF_CHECK_OVERWRITE_ATTEMPTS=1
	export FOX_REMOVE_AAPT=1
	export OF_SUPPORT_OZIP_DECRYPTION=1
	export OF_TARGET_DEVICES="tulip,tulix,twolip"
	export TARGET_DEVICE_ALT='tulip,twolip'
	export OF_DONT_KEEP_LOG_HISTORY=1
	export OF_ALLOW_DISABLE_NAVBAR=1
	export OF_CLOCK_POS=2
	export OF_HIDE_NOTCH=1
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_STATUS_H=84
	export OF_MAINTAINER="XelXen"
	export FOX_VERSION="X11.1"
	export OF_USE_HEXDUMP=1
	export FOX_DELETE_AROMAFM=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_OTA_RES_DECRYPT=1
	export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_USE_NEW_MAGISKBOOT=1
	export OF_MAINTAINER_AVATAR="./device/xiaomi/tulip/misc/avatar.png"
	export LC_ALL="C"
    # -- End here --

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	fi

   	for var in eng userdebug; do
       	    add_lunch_combo twrp_"$FDEVICE"-eng
   	done
fi
#
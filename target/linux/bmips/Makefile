#
# Copyright (C) 2017 LEDE project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mips
BOARD:=bmips
BOARDNAME:=Broadcom BMIPS
CPU_TYPE:=mips32
FEATURES:=squashfs usb pci pcmcia
MAINTAINER:=Álvaro Fernández Rojas <noltari@gmail.com>

KERNEL_PATCHVER:=4.9

define Target/Description
	Build firmware images for BCM33xx cable modem chips,
	BCM63xx DSL chips, and BCM7xxx set-top box chips.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += swconfig

$(eval $(call BuildTarget))

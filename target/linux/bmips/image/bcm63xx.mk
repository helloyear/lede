#
# BCM63xx Profiles
#

define Device/bcm33xx
  KERNEL :=
# KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-lzma bin | hcs-initramfs
  KERNEL_INITRAMFS := kernel-bin | append-dtb | hcs-initramfs
  IMAGES :=
  HCS_MAGIC_BYTES :=
  HCS_REV_MIN :=
  HCS_REV_MAJ :=
endef
DEVICE_VARS += HCS_MAGIC_BYTES HCS_REV_MIN HCS_REV_MAJ

define Device/bcm63xx
  KERNEL := kernel-bin | append-dtb | relocate-kernel | lzma | lzma-cfe
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-lzma elf
  IMAGES := cfe.bin
  IMAGE/cfe.bin := cfe-bin --pad $$$$(shell expr $$$$(FLASH_MB) / 2)
  IMAGE/sysupgrade.bin := cfe-bin
  BLOCK_SIZE := 0x10000
  IMAGE_OFFSET :=
  FLASH_MB := 4
  CFE_BOARD_ID :=
  CFE_CHIP_ID :=
  CFE_EXTRAS := --block-size $$(BLOCK_SIZE) --image-offset $$(if $$(IMAGE_OFFSET),$$(IMAGE_OFFSET),$$(BLOCK_SIZE))
endef
DEVICE_VARS += BLOCK_SIZE FLASH_MB IMAGE_SIZE
DEVICE_VARS += CFE_BOARD_ID CFE_CHIP_ID CFE_EXTRAS

### Comtrend ###
define Device/AR-5381u
  $(Device/bcm63xx)
  IMAGES += sysupgrade.bin
  DEVICE_TITLE := Comtrend AR-5381u
  DEVICE_DTS := ar-5381u
  CFE_BOARD_ID := 96328A-1241N
  CFE_CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += AR-5381u

define Device/AR-5387un
  $(Device/bcm63xx)
  IMAGES += sysupgrade.bin
  DEVICE_TITLE := Comtrend AR-5387un
  DEVICE_DTS := ar-5387un
  CFE_BOARD_ID := 96328A-1441N1
  CFE_CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += AR-5387un

define Device/VG-8050
  $(Device/bcm63xx)
  IMAGES :=
  DEVICE_TITLE := Comtrend VG-8050
  DEVICE_DTS := vg-8050
  CFE_BOARD_ID := 963169P-1861N5
  CFE_CHIP_ID := 63268
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += VG-8050

define Device/VR-3025u
  $(Device/bcm63xx)
  IMAGES += sysupgrade.bin
  DEVICE_TITLE := Comtrend VR-3025u
  DEVICE_DTS := vr-3025u
  CFE_BOARD_ID := 96368M-1541N
  CFE_CHIP_ID := 6368
  FLASH_MB := 32
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += VR-3025u

define Device/VR-3025un
  $(Device/bcm63xx)
  DEVICE_TITLE := Comtrend VR-3025un
  DEVICE_DTS := vr-3025un
  CFE_BOARD_ID := 96368M-1341N
  CFE_CHIP_ID := 6368
  FLASH_MB := 8
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += VR-3025un

define Device/VR-3032u
  $(Device/bcm63xx)
  IMAGES :=
  DEVICE_TITLE := Comtrend VR-3032u
  DEVICE_DTS := vr-3032u
  CFE_BOARD_ID := 96368M-1341N
  CFE_CHIP_ID := 63268
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += VR-3032u

define Device/WAP-5813n
  $(Device/bcm63xx)
  DEVICE_TITLE := Comtrend WAP-5813n
  DEVICE_DTS := wap-5813n
  CFE_BOARD_ID := 96369R-1231N
  CFE_CHIP_ID := 6368
  FLASH_MB := 8
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += WAP-5813n

### Huawei ###
define Device/HG520v
  $(Device/bcm63xx)
  IMAGES := cfe.bin
  DEVICE_TITLE := Huawei EchoLife HG520v
  DEVICE_DTS := hg520v
  CFE_BOARD_ID := HW6358GW_B
  CFE_CHIP_ID := 6358
  CFE_EXTRAS := --rsa-signature "EchoLife_HG520v"
endef
TARGET_DEVICES += HG520v

define Device/HG556a_A
  $(Device/bcm63xx)
  IMAGES := cfe.bin
  DEVICE_TITLE := Huawei EchoLife HG556a (version A - Atheros)
  DEVICE_DTS := hg556a-a
  CFE_BOARD_ID := HW556
  CFE_CHIP_ID := 6358
  CFE_EXTRAS := --rsa-signature "EchoLife_HG556a" --tag-version 8
  IMAGE_OFFSET := 0x20000
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += HG556a_A

define Device/HG556a_B
  $(Device/bcm63xx)
  IMAGES := cfe.bin
  DEVICE_TITLE := Huawei EchoLife HG556a (version B - Atheros)
  DEVICE_DTS := hg556a-b
  CFE_BOARD_ID := HW556
  CFE_CHIP_ID := 6358
  CFE_EXTRAS := --rsa-signature "EchoLife_HG556a" --tag-version 8
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += HG556a_B

define Device/HG556a_C
  $(Device/bcm63xx)
  IMAGES := cfe.bin
  DEVICE_TITLE := Huawei EchoLife HG556a (version C - Ralink)
  DEVICE_DTS := hg556a-c
  CFE_BOARD_ID := HW556
  CFE_CHIP_ID := 6358
  CFE_EXTRAS := --rsa-signature "EchoLife_HG556a" --tag-version 8
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += HG556a_C

### SFR ###
define Device/NB4-SER
  $(Device/bcm63xx)
  IMAGES := cfe.bin
  DEVICE_TITLE := SFR NeufBox 4 (Sercomm)
  DEVICE_DTS := nb4-ser
  CFE_BOARD_ID := 96358VW
  CFE_CHIP_ID := 6358
  CFE_EXTRAS := --rsa-signature "LEDE-$(REVISION)"
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += NB4-SER

define Device/NB4-FXC
  $(Device/bcm63xx)
  IMAGES := cfe.bin
  DEVICE_TITLE := SFR NeufBox 4 (Foxconn)
  DEVICE_DTS := nb4-fxc
  CFE_BOARD_ID := 96358VW
  CFE_CHIP_ID := 6358
  CFE_EXTRAS := --rsa-signature "LEDE-$(REVISION)"
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += NB4-FXC

define Device/NB6-SER
  $(Device/bcm63xx)
  DEVICE_TITLE := SFR NeufBox 6 (Sercomm)
  DEVICE_DTS := nb6-ser
  CFE_BOARD_ID := NB6-SER-r0
  CFE_CHIP_ID := 6362
  CFE_EXTRAS := --rsa-signature "LEDE-$(REVISION)"
  DEVICE_PACKAGES := \
	$(USB2_PACKAGES)
endef
TARGET_DEVICES += NB6-SER

### Netgear ###
define Device/CVG834G
  $(Device/bcm33xx)
  DEVICE_TITLE := Netgear CVG834G
  DEVICE_DTS := cvg834g
  HCS_MAGIC_BYTES := 0xa020
  HCS_REV_MIN := 0001
  HCS_REV_MAJ := 0022
endef
TARGET_DEVICES += CVG834G

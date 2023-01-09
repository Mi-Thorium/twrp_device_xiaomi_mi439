#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common mithorium-common
ifeq ($(MITHORIUM_KERNEL_VERSION),4.19)
include device/xiaomi/mithorium-common-4.19/BoardConfigCommon.mk
else
include device/xiaomi/mithorium-common/BoardConfigCommon.mk
endif

DEVICE_PATH := device/xiaomi/mi439

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
ifeq ($(MITHORIUM_KERNEL_VERSION),4.19)
TARGET_PREBUILT_KERNEL := device/xiaomi/kernel-mithorium-4.19/mi439/Image.gz-dtb
else
TARGET_PREBUILT_KERNEL := device/xiaomi/kernel-mithorium/mi439/Image.gz-dtb
endif

# Kernel - DTBO
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := true
ifeq ($(MITHORIUM_KERNEL_VERSION),4.19)
BOARD_PREBUILT_DTBOIMAGE := device/xiaomi/kernel-mithorium-4.19/mi439/dtbo.img
else
BOARD_PREBUILT_DTBOIMAGE := device/xiaomi/kernel-mithorium/mi439/dtbo.img
endif

# Partitions
BOARD_USES_METADATA_PARTITION := true

# Partitions - dynamic
BOARD_SUPER_PARTITION_BLOCK_DEVICES := cust system vendor
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 536870912
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1073741824
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE) )

BOARD_SUPER_PARTITION_GROUPS := mi439_dynpart
BOARD_MI439_DYNPART_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_MI439_DYNPART_PARTITION_LIST := system system_ext product vendor odm

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Ramdisk
BOARD_RECOVERYIMAGE_MAX_RAMDISK_SIZE := 20971520
BOARD_RAMDISK_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# TWRP
TW_MAX_BRIGHTNESS := 2047

TW_H_OFFSET := -60
TW_Y_OFFSET := 60

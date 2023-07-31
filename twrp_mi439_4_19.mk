#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_RELEASE_NAME := mi439_4_19

# Kernel
TARGET_KERNEL_VERSION := 4.19

# Inherit from mi439 device
$(call inherit-product, device/xiaomi/mi439/device.mk)

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += $(strip $(shell cat $(LOCAL_PATH)/mi439_4_19/vendor.prop))

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := SDM439
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

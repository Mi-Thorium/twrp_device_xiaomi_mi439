#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Crypto
MITHORIUM_INCLUDE_CRYPTO_FBE := true

# Inherit from mithorium-common
ifeq ($(MITHORIUM_KERNEL_VERSION),4.19)
$(call inherit-product, device/xiaomi/mithorium-common-4.19/mithorium.mk)
else
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)
endif

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/miui

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

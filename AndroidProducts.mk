#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_mi439.mk

COMMON_LUNCH_CHOICES := \
    twrp_mi439-user \
    twrp_mi439-userdebug \
    twrp_mi439-eng

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/omni_mi439.mk

COMMON_LUNCH_CHOICES += \
    omni_mi439-user \
    omni_mi439-userdebug \
    omni_mi439-eng

#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nubia/Z2465N

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

# Inherit some common pb stuff.
$(call inherit-product-if-exists, vendor/pb/config/common.mk)


# Inherit from Z2577 device
$(call inherit-product, device/nubia/Z2465N/device.mk)

PRODUCT_DEVICE := Z2465N
PRODUCT_NAME := twrp_Z2465N
PRODUCT_BRAND := nubia
PRODUCT_MODEL := Z2465N
PRODUCT_MANUFACTURER := nubia

PRODUCT_GMS_CLIENTID_BASE := android-zte

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ussi_arm64_full-user 16 BP2A.250605.031.A3 20260605.044723 release-keys"

BUILD_FINGERPRINT := nubia/P820F05/P820F05:16/BP2A.250605.031.A3/20260605.044723:user/release-keys
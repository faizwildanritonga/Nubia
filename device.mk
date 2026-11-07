#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/nubia/Z2465N


# Enable Virtual A/B OTA
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B OTA 
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# OTA
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    libion.recovery \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

# Boot control HAL + health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    bootctrl.ums9620


# Security (AIDL NDK packages for A16 keymint decrypt)
PRODUCT_PACKAGES += \
    android.hardware.security.secureclock-V1-ndk \
    android.hardware.security.sharedsecret-V1-ndk

# Gatekeeper (HIDL V1 - stock Unisoc gatekeeper@1.0-service.trusty)
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper-V1-ndk

# Keymint (AIDL V2 - stock keymint@2.0-unisoc.service.trusty)
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V3-ndk

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2
    

export OF_CUSTOM_BATTERY_PATH=/sys/class/power_supply/battery/capacity
export OF_SCREEN_H=2400
OF_MAINTAINER := Massatriof16
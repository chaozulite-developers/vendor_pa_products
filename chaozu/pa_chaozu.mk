# Copyright (C) 2017 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Check for target product
ifeq (pa_chaozu,$(TARGET_PRODUCT))

# Use the AOSP stack
TARGET_USES_AOSP := true

# Inherit AOSP device configuration
$(call inherit-product, device/bq/chaozu/aosp_chaozu.mk)

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from common device
$(call inherit-product, device/bq/msm8937-common/msm8937.mk)

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 720

# Generic CAF packages
include device/qcom/common/common.mk

# Override AOSP build properties
PRODUCT_NAME := pa_chaozu
BOARD_VENDOR := bq
PRODUCT_DEVICE := chaozu
PRODUCT_BRAND := bq
PRODUCT_MODEL := Aquaris U
PRODUCT_MANUFACTURER := bq
PRODUCT_GMS_CLIENTID := android-bq

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=chaozu \
    DEVICE_MAINTAINERS="JoseBMX, Maanush, Pablito2020 and xboxfanj"  \
    BUILD_FINGERPRINT=bq/chaozu/chaozu:7.1.1/NMF26F/1107:user/release-keys \
    PRIVATE_BUILD_DESC="chaozu-user 7.1.1 NMF26F 1107 release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif

# Specify phone tech before including full_phone
$(call inherit-product, vendor/osr/config/gsm.mk)

PRODUCT_RELEASE_NAME := mk802

# Inherit some common OSR stuff.
$(call inherit-product, vendor/osr/config/common_full_tablet_wifionly.mk)

$(call inherit-product, device/softwinner/mk802/full_mk802.mk)

# Add Google apps
$(call inherit-product, vendor/google/minimal.mk)
$(call inherit-product, vendor/google/products/maps_support.mk)
$(call inherit-product, vendor/google/products/youtube_support.mk)

# Addons personal (call files from vendor/osr/prebuilt/app)
$(call inherit-product, vendor/osr/addons/superatmel.mk)

PRODUCT_NAME := osr_mk802
PRODUCT_BRAND := Allwinner
PRODUCT_DEVICE := mk802
PRODUCT_MODEL := MK802
PRODUCT_MANUFACTURER := Allwinner

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi TARGET_DEVICE=grouper BUILD_FINGERPRINT="google/nakasi/grouper:4.1.1/JRO03D/402395:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.1.1 JRO03D 402395 release-keys"

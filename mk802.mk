#
# Copyright (C) 2011 The Android Open-Source Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_AAPT_CONFIG := large xlarge mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

#Init files
PRODUCT_COPY_FILES := \
        device/softwinner/mk802/kernel:kernel \
        device/softwinner/mk802/init.rc:root/init.rc \
        device/softwinner/mk802/initlogo.rle:root/initlogo.rle \
        device/softwinner/mk802/init.sun4i.rc:root/init.sun4i.rc \
        device/softwinner/mk802/init.sun4i.usb.rc:root/init.sun4i.usb.rc \
        device/softwinner/mk802/ueventd.sun4i.rc:root/ueventd.sun4i.rc

#Etc files
PRODUCT_COPY_FILES += \
        device/softwinner/mk802/prebuilt/etc/ppp/ip-down:system/etc/ppp/ip-down \
        device/softwinner/mk802/prebuilt/etc/ppp/ip-up:system/etc/ppp/ip-up \
        device/softwinner/mk802/prebuilt/etc/ppp/call-pppd:system/etc/ppp/call-pppd \
        device/softwinner/mk802/prebuilt/etc/firmware/ath3k-1.fw:system/etc/firmware/ath3k-1.fw \
        device/softwinner/mk802/prebuilt/etc/firmware/ath3k-1.fw:system/vendor/firmware/ath3k-1.fw \
        device/softwinner/mk802/prebuilt/etc/3g_dongle.cfg:system/etc/3g_dongle.cfg \
        device/softwinner/mk802/prebuilt/etc/gps.conf:system/etc/gps.conf \
        device/softwinner/mk802/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
        device/softwinner/mk802/prebuilt/etc/usb_modeswitch.sh:system/etc/usb_modeswitch.sh \
        device/softwinner/mk802/prebuilt/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,vendor/softwinner/mk802/propietary/etc/init.d,system/etc/init.d)

PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,vendor/softwinner/mk802/propietary/etc/usb_modeswitch.d,system/etc/usb_modeswitch.d)

#Wifi files
PRODUCT_COPY_FILES += \
        device/softwinner/mk802/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

#Fix for Mali build
$(shell mkdir -p out/target/product/mk802/obj/SHARED_LIBRARIES/libMali_intermediates)
$(shell mkdir -p out/target/product/mk802/obj/SHARED_LIBRARIES/libUMP_intermediates)
$(shell touch out/target/product/mk802/obj/SHARED_LIBRARIES/libMali_intermediates/export_includes)
$(shell touch out/target/product/mk802/obj/SHARED_LIBRARIES/libUMP_intermediates/export_includes)
$(shell mkdir -p out/target/product/mk802/obj/lib/)
$(shell cp vendor/softwinner/mk802/propietary/lib/libMali.so out/target/product/mk802/obj/lib/)
$(shell cp vendor/softwinner/mk802/propietary/lib/libUMP.so out/target/product/mk802/obj/lib/)


#OMX
PRODUCT_COPY_FILES += device/softwinner/mk802/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

#Audio
PRODUCT_COPY_FILES += device/softwinner/mk802/libraries/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
        ro.opengles.version = 131072 \
        debug.egl.hw=1 \
        ro.display.switch=1 \
        ro.sf.lcd_density=160 \
        hwui.render_dirty_regions=false \
        wifi.interface = wlan0 \
        wifi.supplicant_scan_interval = 150 \
        persist.sys.strictmode.visual=0 \
        persist.sys.strictmode.disable=1 \
        persist.sys.usb.config=mass_storage,adb \
        dalvik.vm.verify-bytecode=false \
        dalvik.vm.dexopt-flags=v=n,o=v \
        dalvik.vm.execution-mode=int:jit \
        persist.sys.timezone=Europe/Amsterdam \
        persist.sys.language=en \
        persist.sys.country=US \
        ro.com.google.locationfeatures=1 \
        dalvik.vm.lockprof.threshold=500 \
        ro.kernel.android.checkjni=0 \
        dalvik.vm.checkjni=false \
        dalvik.vm.dexopt-data-only=1 \
        ro.vold.umsdirtyratio=20 \
        persist.sys.use_dithering=0 \
        persist.sys.purgeable_assets=0 \
        windowsmgr.max_events_per_sec=240 \
        view.touch_slop=2 \
        view.minimum_fling_velocity=25 \
        updateme.disableinstalledapps=1 \
        updateme.disablescripts=1 \
        ro.additionalmounts=/storage/sdcard1 \
        ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
        persist.sys.vold.switchexternal=0 \
        service.adb.root=1 \
        ro.disable_phablet_ui=1

DEVICE_PACKAGE_OVERLAYS := device/softwinner/mk802/overlay

# Permissions
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PACKAGES += \
	Galaxy4 \
	NoiseField \
	PhaseBeam \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        HoloSpiralWallpaper \
        VisualizationWallpapers \
        librs_jni

PRODUCT_PACKAGES += \
        gralloc.sun4i \
        hwcomposer.exDroid \
        lights.sun4i \
        display.sun4i \
        libcedarxbase \
        libcedarxosal \
        libcedarv \
        libcedarv_adapter \
        libcedarv_base \
        libCedarA \
        libCedarX \
        libstagefright_soft_cedar_h264dec \
        libswdrm \
        libaw_audio \
        libaw_audioa \
        libfacedetection \
        librtmp \
        libve \
        audio.primary.exDroid \
        audio.a2dp.default \
        audio.usb.default \
        libaudioutils \
        chat \
        u3gmonitor \
        devlistener

PRODUCT_PACKAGES += \
	static_busybox \
        make_ext4fs \
        e2fsck

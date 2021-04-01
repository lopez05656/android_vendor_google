#
# Copyright (C) 2018-2019 The Google Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
#
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := MyVerizonServices
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := MyVerizonServices.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_REQUIRED_MODULES := libakuaf libmotricity
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

LIBAKUAF_SYMLINK := $(TARGET_OUT_PRODUCT)/priv-app/MyVerizonServices/lib/arm64/libakuaf.so
$(LIBAKUAF_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "libakuaf link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib64/libakuaf.so $@

LIBMOTRICITY_SYMLINK := $(TARGET_OUT_PRODUCT)/priv-app/MyVerizonServices/lib/arm64/libmotricity.so
$(LIBMOTRICITY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "libmotricity link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib64/libmotricity.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIBAKUAF_SYMLINK) $(LIBMOTRICITY_SYMLINK)

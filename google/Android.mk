LOCAL_PATH := $(my-dir)

USE_REAL_PLAYSTORE := FackStore

##############################
$(shell mkdir -p $(PRODUCT_OUT)/system)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := GoogleServicesFramework
LOCAL_SRC_FILES := ./system/priv-app/GoogleServicesFramework.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_CERTIFICATE := platform
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := GooglePlayServices
LOCAL_SRC_FILES := ./system/priv-app/GooglePlayServices.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_CERTIFICATE := platform
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)



# 根据 USE_REAL_PLAYSTORE 的值执行不同的代码
ifeq ($(USE_REAL_PLAYSTORE), NoneStore)
    $(shell cp -rf $(LOCAL_PATH)/system/* $(PRODUCT_OUT)/system/ && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayServices.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GoogleServicesFramework.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-M.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-G.apk.bak && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-A.apk)

    include $(CLEAR_VARS)
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE := GooglePlayStore
    LOCAL_SRC_FILES := ./system/priv-app/GooglePlayStore-M.apk
    LOCAL_MODULE_CLASS := APPS
    LOCAL_BUILT_MODULE_STEM := package.apk
    LOCAL_CERTIFICATE := platform
    LOCAL_ENFORCE_USES_LIBRARIES := false
    LOCAL_PRIVILEGED_MODULE := true
    include $(BUILD_PREBUILT)
endif

#if you want to use the real GooglePlayStore
ifeq ($(USE_REAL_PLAYSTORE), GooglePlayStore)
    $(shell cp -rf $(LOCAL_PATH)/system/* $(PRODUCT_OUT)/system/ && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayServices.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GoogleServicesFramework.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-M.apk && mv $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-G.apk.bak $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-G.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-A.apk)
endif

ifeq ($(USE_REAL_PLAYSTORE), FackStore)
    $(shell cp -rf $(LOCAL_PATH)/system/* $(PRODUCT_OUT)/system/ && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayServices.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GoogleServicesFramework.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-M.apk && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-G.apk.bak && rm -rf $(PRODUCT_OUT)/system/priv-app/GooglePlayStore-A.apk)

    include $(CLEAR_VARS)
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE := GooglePlayStore
    LOCAL_SRC_FILES := ./system/priv-app/GooglePlayStore-M.apk
    LOCAL_MODULE_CLASS := APPS
    LOCAL_BUILT_MODULE_STEM := package.apk
    LOCAL_CERTIFICATE := platform
    LOCAL_ENFORCE_USES_LIBRARIES := false
    LOCAL_PRIVILEGED_MODULE := true
    include $(BUILD_PREBUILT)

    include $(CLEAR_VARS)
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE := FackStore
    LOCAL_SRC_FILES := ./system/priv-app/GooglePlayStore-A.apk
    LOCAL_MODULE_CLASS := APPS
    LOCAL_BUILT_MODULE_STEM := package.apk
    LOCAL_CERTIFICATE := platform
    LOCAL_ENFORCE_USES_LIBRARIES := false
    LOCAL_PRIVILEGED_MODULE := true
    include $(BUILD_PREBUILT)
endif
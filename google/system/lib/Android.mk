LOCAL_PATH := $(my-dir)
##############################
$(shell cp -rf $(LOCAL_PATH)/*.so $(PRODUCT_OUT)/system/lib/)

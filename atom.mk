LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := adbd
LOCAL_CATEGORY_PATH := system

LOCAL_AUTOTOOLS_MAKE_BUILD_ARGS := \
	CC="$(CCACHE) $(TARGET_CC)" \
	CXX="$(CCACHE) $(TARGET_CXX)" \
	CFLAGS="$(TARGET_GLOBAL_CFLAGS)" \
	LDFLAGS="$(TARGET_GLOBAL_LDFLAGS) -pthread" \
	VPATH=$(LOCAL_PATH)/..

LOCAL_AUTOTOOLS_MAKE_INSTALL_ARGS := \
	$(LOCAL_AUTOTOOLS_MAKE_BUILD_ARGS) \
	prefix=$(TARGET_OUT_STAGING)/usr

ADBD_BUILD_DIR := $(call local-get-build-dir)
define LOCAL_AUTOTOOLS_CMD_CONFIGURE
	$(Q) cp -pf $(PRIVATE_PATH)/Makefile $(ADBD_BUILD_DIR)/obj/
endef

include $(BUILD_AUTOTOOLS)


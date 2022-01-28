RTL8821CU_VERSION = 5.12.0
RTL8821CU_SITE = $(call github,t123yh,8821cu,$(RTL8821CU_VERSION))
RTL8821CU_LICENSE = GPL-2.0
RTL8821CU_LICENSE_FILES = LICENSE

RTL8821CU_MODULE_MAKE_OPTS = \
        CONFIG_RTL8821CU=m \
        KVER=$(LINUX_VERSION_PROBED) \
        USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
                -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))


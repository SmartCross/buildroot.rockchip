RTK_BTUSB_VERSION = 20210324
RTK_BTUSB_SITE = $(call github,t123yh,rtk-btusb,$(RTK_BTUSB_VERSION))
RTK_BTUSB_LICENSE = GPL-2.0

RTK_BTUSB_MODULE_SUBDIRS = module

define RTK_BTUSB_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/firmware/* $(TARGET_DIR)/lib/firmware
endef

$(eval $(kernel-module))
$(eval $(generic-package))

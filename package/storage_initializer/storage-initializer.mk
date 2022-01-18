STORAGE_INITIALIZER_VERSION = master
STORAGE_INITIALIZER_SITE = $(call github,smartcross,storage_initializer,$(STORAGE_INITIALIZER_VERSION))

$(eval $(cmake-package))

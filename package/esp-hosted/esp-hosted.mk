ESP_HOSTED_VERSION = 1.0
ESP_HOSTED_SITE = $(call github,t123yh,esp-hosted,$(ESP_HOSTED_VERSION))
ESP_HOSTED_MODULE_SUBDIRS = host/linux/host_driver/esp32
ESP_HOSTED_SUBDIR = host/linux/host_control/c_support

$(eval $(kernel-module))
$(eval $(cmake-package))

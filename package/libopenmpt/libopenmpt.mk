LIBOPENMPT_VERSION = 0.5.9
LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
LIBOPENMPT_INSTALL_STAGING = YES
LIBOPENMPT_INSTALL_TARGET = YES
LIBOPENMPT_DEPENDENCIES = zlib mpg123 libvorbis
LIBOPENMPT_CONF_OPTS = --disable-openmpt123 --without-portaudio --without-portaudiocpp --without-sndfile --without-flac

$(eval $(autotools-package))


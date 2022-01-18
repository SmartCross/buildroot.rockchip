MUSIKCUBE_VERSION = 0.96.7
MUSIKCUBE_SITE = git://github.com/clangen/musikcube.git
MUSIKCUBE_INSTALL_STAGING = YES
MUSIKCUBE_INSTALL_TARGET = YES
MUSIKCUBE_CONF_OPTS = -DENABLE_FFMPEG=false -DENABLE_BUNDLED_TAGLIB=false
MUSIKCUBE_DEPENDENCIES = libogg libvorbis ncurses zlib alsa-lib libcurl libmicrohttpd lame libev libopenmpt faad2 flac taglib

$(eval $(cmake-package))

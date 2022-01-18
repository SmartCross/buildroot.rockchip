#!/bin/bash

mkdir -p $TARGET_DIR/boot
echo Creating data-skeleton!
fakeroot sh -c "
  chown -R 0:0 $BR2_EXTERNAL_RK3308_PATH/data-skeleton
  chmod -R og-w $BR2_EXTERNAL_RK3308_PATH/data-skeleton
  tar -czf $TARGET_DIR/usr/share/data-skeleton.tar.gz -C $BR2_EXTERNAL_RK3308_PATH/data-skeleton .
"

# enable swd debugging interface
# mw.l 0xFF000034 06600440 1

# Disable i2s0_8ch mclk output to be able to use the pin as mclk input.
# This should have been handled in clk framework, but due to some insanity in
# rockchip clock tree, it is not so easy to do modifications there,
# but much easier to just write a register here.
# Please refer to TRM for more info.
mw.l 0xFF500334 00300030 1

setenv bootargs "root=/dev/mmcblk0p2 ro rootwait"
fatload mmc ${devnum}:${distro_bootpart} ${fdt_addr_r} rockchip/rk3308-smartcross.dtb
fatload mmc ${devnum}:${distro_bootpart} ${kernel_addr_r} Image

booti ${kernel_addr_r} - ${fdt_addr_r}

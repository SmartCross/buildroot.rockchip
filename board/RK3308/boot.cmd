# enable swd debugging interface
# mw.l 0xFF000034 06600440 1

# Disable i2s0_8ch mclk output to be able to use the pin as mclk input.
# This should have been handled in clk framework, but due to some insanity in
# rockchip clock tree, it is not so easy to do modifications there,
# but much easier to just write a register here.
# Please refer to TRM for more info.
mw.l 0xFF500334 0x00300030 1


# GPIO4_C0 is connected to SDOUT pin of CS8416, which determines control port mode
# (high = software mode, low = hardware mode). By default, GPIO4_C0 is pulled down
# by the internal circuit of RK3308 (GRF_GPIO4C_P register). Although there's a 47k
# exteral pull up resistor, it is not enough to pull the signal to a high level.
# This command configures the internal pull of GPIO4_C0 to pull-up, to ensure SDOUT
# pin is high before resetting.
mw.l 0xFF0000E8 0x00030001 1

# GPIO4_D1 is the reset pin of CS8416. This pin is pulled up by default. This means
# that CS8416 is not held in reset during boot. Combined with the pull-down behaviour
# of SDOUT pin (see above), CS8416 will be in hardware control mode. This will
# interfere i2c1 bus (specifically, SDA pin will be pulled low). So we pull down GPIO4_D1
# here to put CS8416 in reset state, ensuring normal bus operation.
mw.l 0xFF0000EC 0x000C0008 1

setenv bootargs "root=/dev/mmcblk0p2 ro rootwait"
fatload mmc ${devnum}:${distro_bootpart} ${fdt_addr_r} rockchip/rk3308-smartcross.dtb
fatload mmc ${devnum}:${distro_bootpart} ${kernel_addr_r} Image

booti ${kernel_addr_r} - ${fdt_addr_r}

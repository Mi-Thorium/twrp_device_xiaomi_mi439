#!/system/bin/sh

source /system/bin/mithorium-utils.sh

set_device_codename "$(cat /sys/xiaomi-sdm439-mach/codename)"
set_device_model "$(cat /sys/xiaomi-sdm439-mach/product_name)"

case "$(cat /sys/xiaomi-sdm439-mach/codename)" in
	"pine")
		for i in x y w h; do
			setprop twrp.gui.offset.${i} 0
		done
		;;
	"olive"|"olivelite"|"olivewood")
		setprop "persist.vendor.ctm.disallowed" "true"
		;;
esac

exit 0
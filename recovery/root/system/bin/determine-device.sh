#!/system/bin/sh

source /system/bin/mithorium-utils.sh

LAST_CODENAME_FILE="/mnt/cache/last-recovery-codename"

case "$(cat /sys/firmware/devicetree/base/model)" in
	"PINE QRD")
		set_device_codename "pine"
		set_device_model "Redmi 7A"
		for i in x y w h; do
			setprop twrp.gui.offset.${i} 0
		done
		;;
	"Olive QRD")
		set_device_codename "olives"
		set_device_model "Redmi 8 / 8A / 8A Dual"
		setprop "persist.vendor.ctm.disallowed" "true"
		;;
esac

mkdir -p /mnt/cache
umount /mnt/cache || true
mount -o ro /dev/block/by-name/cache /mnt/cache || true
if [ -f "$LAST_CODENAME_FILE" ]; then
	set_device_codename "$(cat $LAST_CODENAME_FILE)"
fi
umount /mnt/cache || true

exit 0

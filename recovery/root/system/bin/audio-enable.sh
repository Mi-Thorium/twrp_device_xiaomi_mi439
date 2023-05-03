#!/system/bin/sh

ENABLE=$1

#tinymix '     ' $([ "$ENABLE" == 1 ] && echo -n "ENABLE" || echo -n "DISABLE")

# Enable BE DAI
tinymix 'PRI_MI2S_RX Audio Mixer MultiMedia1' $([ "$ENABLE" == 1 ] && echo -n "1" || echo -n "0")

# Enable device specific mixers
tinymix "MI2S_RX Channels" "One"
tinymix "RX3 MIX1 INP1" $([ "$ENABLE" == 1 ] && echo -n "RX1" || echo -n "ZERO")
tinymix "LINE_OUT" $([ "$ENABLE" == 1 ] && echo -n "Switch" || echo -n "ZERO")
tinymix "Ext Spk Switch" $([ "$ENABLE" == 1 ] && echo -n "On" || echo -n "Off")

setprop "audio.ready" "$ENABLE"

exit 0

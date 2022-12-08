opts=(
--pentadactyl
+purgecaches
++cmd "se rtp=$cm/pen | se! bw.profile=$1 | lpl (js|pen)$"
)
opts="${opts[@]}"

profile=$1
proxy='pentadactyl@addons.palemoon.org'
user_pref=\
'user_pref("extensions.bootstrappedAddons", '
'"{\"pentadactyl@addons.palemoon.org\":'\
'{\"version\":\"1.3.1\",\"type\":\"extension\",\"descriptor\":\"'\
"$profile/extensions/$proxy"
'\",\"multiprocessCompatible\":false,\"active\":true,'\
'\"userDisabled\":false,\"appDisabled\":false}}");'; }

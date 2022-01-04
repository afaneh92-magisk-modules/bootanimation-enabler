SKIPUNZIP=1

# Extract files
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" module.prop  -d $MODPATH >&2

# Extract bootanimation files
unzip -o "$ZIPFILE" "system/*" -d "$MODPATH" >&2;

# paths
animation=/sdcard/bootanimation.zip
replace_path="$MODPATH/system/media"

if [ -e "$animation" ]; then
  cp -f -p $animation $replace_path
  ui_print "- Found /sdcard/bootanimation.zip ..."
  ui_print " "
else
  ui_print " "
  ui_print "- Not found /sdcard/bootanimation.zip use pixel instead ..."
fi

# Set executable permissions
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm_recursive $MODPATH/system/bin 0 0 0755 0755

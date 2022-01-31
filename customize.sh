SKIPUNZIP=1

# Extract files
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" module.prop  -d $MODPATH >&2

# Extract bootanimation files
unzip -o "$ZIPFILE" "system/*" -d "$MODPATH" >&2;

fatal=true
for i in /sdcard /data/media/0; do
  if ! `find $i -type f -name 'bootanimation.zip'` ; then
    mkdir -p $MODPATH/system/media
    cp -f -p $i/bootanimation.zip $MODPATH/system/media/
    ui_print "- Found $i/bootanimation.zip ..."
    fatal=false
    break
  fi
done

if [ "$fatal" == "true" ]; then
  ui_print "- Not found bootanimation.zip, using Android default..."
fi

# Set executable permissions
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm_recursive $MODPATH/system/bin 0 0 0755 0755

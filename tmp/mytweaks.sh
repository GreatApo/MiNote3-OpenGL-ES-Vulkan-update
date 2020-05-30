#!/sbin/sh

bp="/system/build.prop"

busybox mount /system
busybox mount /data



if [ -f /system/build.prop.GL_VK_bak ]; 
  then
    rm -rf $bp
    cp $bp.GL_VK_bak $bp
  else
    cp $bp $bp.GL_VK_bak
fi


echo " " >> $bp
echo "# TWRP_GL-VK-RV454v8 changes" >> $bp

for mod in update-build.prop;
  do

    for prop in `cat /tmp/$mod`;do
      export newprop=$(echo ${prop} | cut -d '=' -f1)
      sed -i "/${newprop}/d" /system/build.prop
      echo $prop >> /system/build.prop
    done
done


#!/sbin/sh

bp="/system/system/build.prop"

busybox mount /system
busybox mount /data



if [ -f /system/system/build.prop.GL_VK_bak ]; 
  then
    rm -rf $bp
    cp $bp.GL_VK_bak $bp
  else
    cp $bp $bp.GL_VK_bak
fi


echo " " >> $bp
echo "# TWRP_GL-VK-RV490v10 changes" >> $bp

for mod in update-build.prop;
  do

    for prop in `cat /tmp/$mod`;do
      export newprop=$(echo ${prop} | cut -d '=' -f1)
      sed -i "/${newprop}/d" /system/system/build.prop
      echo $prop >> /system/system/build.prop
    done
done


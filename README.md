使用方法：
下载后，将google目录拷贝到/vendor/目录下，执行整包编译

注意事项：
google/Android.mk文件在中，USE_REAL_PLAYSTORE := true 时，将会在镜像中带上AndroidTV版本的谷歌商店。
如果您的镜像中不需要谷歌商店，请自行修改USE_REAL_PLAYSTORE := false

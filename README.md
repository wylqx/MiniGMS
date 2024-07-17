使用方法：
下载后，将google目录拷贝到/vendor/目录下，执行整包编译

注意事项：
google/Android.mk文件
USE_REAL_PLAYSTORE := GooglePlayStore 时，将会在镜像中带上AndroidTV版本的谷歌商店（注意，某些海外应用未针对android新版本做适配，从而导致在获取谷歌商店信息packageManager.getPackageInfo进行GMS正确性校验时失败，无法正常运行）；
USE_REAL_PLAYSTORE := FackStore时，使用运行在selinux权限为permissive环境下的特殊版应用商店，针对海外应用兼容性较好（注意，此模式下用户无法自行安装谷歌应用商店）；
USE_REAL_PLAYSTORE := NoneStore时，默认不会安装任何应用商店（注意，此模式下用户无法自行安装谷歌应用商店）。

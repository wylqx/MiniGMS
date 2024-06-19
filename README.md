使用方法：
下载后，将google目录拷贝到/vendor/目录下，执行整包编译

注意事项：
google/Android.mk文件在中，USE_REAL_PLAYSTORE := true 时，将会在镜像中带上AndroidTV版本的谷歌商店（注意，谷歌商店可能会导致某些应用在进行GMS正确性校验时失败,从而无法运行）。
如果您的镜像中不需要谷歌商店，请保持USE_REAL_PLAYSTORE := false

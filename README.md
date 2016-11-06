功能简介：
限制非ROOT手机APP的自动唤醒

适用情况：
- 该方法仅适用于Android 7.0 +
- 该方法并不完美，若手机已ROOT，推荐使用其它更彻底的方案
- 内置后台限制的安卓（如MIUI、EMUI），无需使用本方法

使用步骤：

1、下载最新releases并解压（若直接从code中下载，请注意bat文件编码必须是ANSI才能运行）

- https://github.com/Jiangyiqun/android_background_ignore/releases

2、电脑安装 ADB

- http://forum.xda-developers.com/showthread.php?p=48915118#post48915118

3、电脑安装 Universal Android USB driver

- http://dl.google.com/android/repository/usb_driver_r11-windows.zip

4、手机开启 USB 调试 

5、运行 android_background_ingore.bat

技术说明：
Android 7.0 新增了一个AppOps项 RUN_IN_BACKGROUND，可用来限制指定APP自动唤醒，如下：

For this implementation, we now keep track of how long a uid has
been in the background, and after a certain amount of time
(currently 1 minute) we mark it as "idle".  Any packages associated
with that uid are then no longer allowed to run in the background.
This means, until the app next goes in the foreground:

- No manifest broadcast receivers in the app will execute.
- No services can be started (binding services is still okay,
  as this is outside dependencies on the app that should still
  be represented).
- All alarms for the app are cancelled and no more can be set.
- All jobs for the app are cancelled and no more can be scheduled.
- All syncs for the app are cancelled and no more can be requested.

参考1：https://zhuanlan.zhihu.com/p/22162719

参考2：https://developer.android.com/topic/performance/background-optimization.html

本项目即给所有第三方APP执行如下命令：
- adb shell cmd appops set <package_name> RUN_IN_BACKGROUND ignore

已知问题：

问题1：部分APP会工作异常

对策是维护一个白名单，程序会把 white_list.txt 中APP自动设置为 RUN_IN_BACKGROUND allow 状态。若发现未包含的APP，请提交至：https://github.com/Jiangyiqun/android_background_ignore/issues

问提2：部分APP仍然会唤醒

无法阻止JobScheduler自动唤醒APP，例如大众点评、Bilibili

-这种唤醒频率较低，听说也较为省电。参考：https://www.zhihu.com/question/24360587

无法阻止添加系统账号导致的互相唤醒，阿里系多使用此方法

无法阻止ShareServie导致的互相唤醒，百度系多使用此方法

-少装阿里系/百度系的APP，可以减少互相唤醒

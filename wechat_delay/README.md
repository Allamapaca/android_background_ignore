使用本项目后，若发现微信（有时）推送延时，请参考下文排查解决：

## 重点排查

### 后台限制脚本
无论是否使用GCM，把微信加入 android_background_ignore.bat 白名单

### 绿色守护
无论是否使用GCM，确保微信不在绿化名单中

### 后台数据
设置 - 应用 - 微信 - 流量使用情况 - 允许后台数据
若使用流量节省程序，还应勾选不限制数据流量

### 休眠Wifi连接
设置 - WLAN - 配置WLAN（右上角齿轮图标） - 在休眠状态下保持WLAN网路连接 - 始终

### 电池优化
设置 - 电池 - 电池优化（右上角三个点图标） -  所有应用 - 微信 - 优化

## 其它尝试

### 内置应用
参考[内置应用停用列表](https://github.com/Jiangyiqun/android_background_ignore/tree/master/disable_google_apps)，不要停用多余的内置应用，尤其是系统应用

### 自动同步
设置 - 账号 - 右上角三个点图标 - 勾选自动数据同步
添加账号 - 微信 - 点击你的用户名 - 勾选通讯录同步

### 时间
设置 - 日期和时间 - 取消自动确定日期和时间，取消自动确定时区

### 网络不稳定
可能由于网络不稳定导致，而非系统设置问题，以下为排查建议：
1. 若使用shadowsocks，请使用分应用代理功能，把微信加入排除名单，避免服务器不稳定
2. 使用数据网络时，关闭Wifi，以避免自动连上无效的公共WIfi（如酒店、麦当劳、机场提供的 Wifi。推荐[修改网络验证服务器](https://github.com/Jiangyiqun/android_background_ignore/tree/master/captive_portal_server_changer)更好的知晓WIfi有效性。



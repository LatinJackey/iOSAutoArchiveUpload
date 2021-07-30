# iOSAutoArchiveScript

### 使用贴士：

在工程主目录创建plist文件（ExportOptions.plist)必须使用这个名字
可以自己创建，也可以从已打包的文件中获取
![](https://github.com/LatinJackey/iOSAutoArchiveUpload/blob/master/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%20.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>compileBitcode</key>
	<true/>
	<key>destination</key>
	<string>export</string>
	<key>method</key>
	<string>ad-hoc</string>
	<key>provisioningProfiles</key>
	<dict>
		<key>com.xxxx.xxxxx</key>
		<string>xxxx_Distribution</string>
	</dict>
	<key>signingCertificate</key>
	<string>iPhone Distribution</string>
	<key>signingStyle</key>
	<string>manual</string>
	<key>stripSwiftSymbols</key>
	<true/>
	<key>teamID</key>
	<string>XXXXXX</string>
	<key>thinning</key>
	<string>&lt;none&gt;</string>
</dict>
</plist>
```

### 获取方法：
  用xcode打包后，导出时，选择手动管理证书文件，选择完毕后导出，在导出的文件夹中可以看到ExportOptions.plist文件。
  将该文件拖入到工程主目录即可
  ![](https://github.com/LatinJackey/iOSAutoArchiveUpload/blob/master/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A72.png)
  
### 使用ssh登录到打包服务器：
1.解锁钥匙串：security unlock-keychain
2.使用脚本打包
#### 可设置别名命令，全局运行脚本
.zsh alias xxAlias="source path/xx.sh"
  
 
 

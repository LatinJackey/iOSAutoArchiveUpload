#!/bin/bash

ProjectDir=$(find . -maxdepth 1 -name "*xcworkspace")

#工程区
workspacename=$(basename ${ProjectDir})

#工程名
projectName=${workspacename%.*}

#编译时间
archiveTime=$(date "+%Y-%m-%d==%H_%M_%S") 

#编译路径
archivePath=~/Desktop/Apps/Archives/${archiveTime}${projectName}.xcarchive

#导出包目录
exportPath=~/Desktop/Apps/Exports/${archiveTime}${projectName}

#到处所需plist路径
plistPath=./ExportOptions.plist

#编译
type=""

echo "请输入要打包的类型:Release/Debug (区分大小写)"

read archiveType

function archiveProject(){	
 	xcodebuild -workspace ${workspacename} -scheme ${projectName} -configuration ${archiveType} -archivePath $archivePath archive
}

#导出
function exportProject(){
	xcodebuild -exportArchive -archivePath ${archivePath} -exportOptionsPlist ${plistPath} -exportPath ${exportPath}
}
#上传到蒲公英
function uploadipa(){
	# 发布到蒲公英
	uKey=""
	apiKey=""
	password=""
	app_path=${exportPath}/${projectName}.ipa
	curl -F "file=@${app_path}" -F "uKey=${uKey}" -F "_api_key=${apiKey}" -F "publishRange=2" -F "password=${password}" http://www.pgyer.com/apiv1/app/upload
}

archiveProject

exportProject

uploadipa






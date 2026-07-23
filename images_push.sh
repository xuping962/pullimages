#!/bin/bash
docker login --username=${{ secrets.USR }} --password=${{ secrets.PSW }} registry.cn-hangzhou.aliyuncs.com


for i in `cat images.txt`;do 
      docker pull --platform linux/arm64 $i
      #docker pull --platform linux/amd64 $i
done


for i in `cat images.txt`;do 
   filename=${i##*/}
   docker tag  $i  registry.cn-hangzhou.aliyuncs.com/xinzhi/${filename} 
   docker push  registry.cn-hangzhou.aliyuncs.com/xinzhi/${filename}
done 

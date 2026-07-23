#!/bin/bash

for i in `cat images.txt`;do 
      docker pull --platform linux/arm64 $i
      #docker pull --platform linux/amd64 $i
done


for i in `cat images.txt`;do 
   filename=${i##*/}
   docker tag  $i  registry.cn-hangzhou.aliyuncs.com/xinzhi/${filename} 
   docker push  registry.cn-hangzhou.aliyuncs.com/xinzhi/${filename}
done 

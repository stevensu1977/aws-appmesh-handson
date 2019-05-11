# aws-appmesh-handson

* Author:	[StevenSu](mailto:suwei007@gmail.com) 

* Blog:	https://stevensu.me

## Update
   * 2019/04/14 
      * 增加generate_deploy.sh 
      * 根据AWS_REGION环境变量动态为manual生成所需yaml
      * 增加Lab07 sidecar自动注入
   * 2019/05/07
      * 增加auto-inject 配置说明
      * 增加service image 说明
   * 2019/05/11
      * 增加manual inject x-ray配置(V1)
      * 增加x-ray 截图
  
  
## Overview 

  This is aws appmesh hands-on workshop project

![appmesh](https://github.com/stevensu1977/aws-appmesh-handson/blob/master/images/app-mesh.png?raw=true)
	
## Reference:
   * [janakiramm/app-mesh-tutorial](https://github.com/janakiramm/app-mesh-tutorial) 
   * [Getting Started with AWS App Mesh](https://www.youtube.com/watch?v=I6aIp0AmIC0)
   * [AWS App Mesh Examples](https://github.com/aws/aws-app-mesh-examples)
   * [AWS App Mesh Inject project](https://github.com/aws/aws-app-mesh-inject)

## Prerequisites

   * AWS 账号 (EKS建议使用t2.meduim, free tier 账号会产生额外费用 )
   * AWS CLI
     [install](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
     
     并且已经配置好了API Access Key/Secert Access Key
     
     ```bash
     aws --version
     aws-cli/1.16.128 Python/3.7.3 Darwin/18.5.0 botocore/1.12.118     
     
     #配置access key/secert access key
     aws configure
     ```
     
   * eksctl 
     
     ```bash
     #linux
     curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
     sudo mv /tmp/eksctl /usr/local/bin
     
     #mac
     brew tap weaveworks/tap
     brew install weaveworks/tap/eksctl
	  
     eksctl version
     [ℹ]  version.Info{BuiltAt:"", GitCommit:"", GitTag:"0.1.26"}
     ```
     
     
## Service 说明
本Lab使用了[janakiramm/app-mesh-tutorial/Services](https://github.com/janakiramm/app-mesh-tutorial/tree/master/Services) 作为演示服务

   * 包括Order , Customer , Product 3个Service，使用python, flask编写 

     ```python
     #Order 服务
     from flask import Flask
     import requests
     import os

     app = Flask(__name__)

     @app.route('/')
     def get_order():	
	     cust_svc_url=os.environ.get('CUST_SVC_URL')
	     prod_svc_url=os.environ.get('PROD_SVC_URL')
	
	     svc_name=os.environ.get('SVC_NAME')
	     svc_ver=os.environ.get('SVC_VER')	
	     response = '{"Service":"'+ svc_name +'", "Version":' + svc_ver + '}\n'
	     response = response + requests.get(cust_svc_url).content.decode('utf-8')
	     response = response + requests.get(prod_svc_url).content.decode('utf-8')
	     return response

     if __name__ == '__main__':
	     app.run(debug=True,host='0.0.0.0',port=5000)

     ```


## Lab & 脚本说明

   * Lab01 创建AWS EKS 集群
   * Lab02 创建Mesh 
   * Lab03 部署应用v1.0 
   * Lab04 部署customer/product 服务新版本
   * Lab05 版本切换/回滚
   * Lab06 AppMesh图形操作演示
   * Lab07 AppMesh Sidecar自动注入
   * tools 工具类脚本

	
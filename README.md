# aws-appmesh-handson

* Author:	[StevenSu](mailto:suwei007@gmail.com) 

* Blog:	https://stevensu.me

##Overview 

  This is aws appmesh hands-on workshop project

![appmesh](https://github.com/stevensu1977/aws-appmesh-handson/blob/master/images/app-mesh.png?raw=true)
	
## Reference:
   * [janakiramm/app-mesh-tutorial](https://github.com/janakiramm/app-mesh-tutorial)
   * [Getting Started with AWS App Mesh](https://www.youtube.com/watch?v=I6aIp0AmIC0)
   * [AWS App Mesh Examples](https://github.com/aws/aws-app-mesh-examples)
	
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

## Lab & 脚本说明

   * Lab01 创建AWS EKS 集群
   * Lab02 创建Mesh 
   * Lab03 部署应用v1.0 
   * Lab04 部署customer/product 服务新版本
   * Lab05 版本切换/回滚
   * Lab06 AppMesh图形操作演示
   * tools 资源清除脚本

	
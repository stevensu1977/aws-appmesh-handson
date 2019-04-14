#App Mesh hands-on

##2019/04/2
 
### Lab07 自动注入
   * 前提条件已经创建了EKS集群,创建了AppMesh
   * 本节实验: 实现sidecar自动注入,减少配置依赖
   * 本节所有app会部署到appmesh-demo这个namespace下面
   * 安装自动注入所需要controler [app-mesh-injector](https://github.com/aws/aws-app-mesh-inject)
      
   * 请使用Lab提供的install-auto-inject.sh
     
     
      ```bash
       #向EKS集群安装inject 所需Name Space, CRD等资源
       #并且在appmesh-demo namespace 启用sidecar自动注入
       install-auto-inject.sh
      ```
      
      ```bash
           
      #部署v1版本服务到EKS集群的appmesh-demo 命名空间
      ./deploy-v1.sh
      
      #查看部署是否成功
      kubectl -n appmesh-demo get pods
      kubectl -n appmesh-demo get svc
      
      #启动curl 客户端
      ./curl_pod.sh
      #执行以下命令 测试服务是否正常
      curl -s http://customer.appmesh-demo.svc.cluster.local:5000
      curl -s http://product.appmesh-demo.svc.cluster.local:5000
      watch -t -n 1 curl -s http://order.default.svc.cluster.local
      
      #清除部署
      #清除EKS上的app deployment
      ./remove-deploys.sh
      
      #删除mesh 
      
      
      
                 
      ```


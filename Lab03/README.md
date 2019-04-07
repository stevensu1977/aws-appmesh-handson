#App Mesh hands-on

##2019/04/2
 
### Lab03 部署应用v1.0到EKS集群

   * 应用包含3个服务, customer , product,order
      order服务会掉用customer, product服务并返回结果
      
      
      ```bash
      cd lab02
      
      #可以使用tools/remove_deploy.sh清除所有部署
      
      ./deploy-v1.sh
      
      #查看部署是否成功
      kubectl get pods
      kubectl get svc
      
      #启动curl 客户端
      ./curl_pod.sh
      #执行以下命令 测试服务是否正常
      curl -s http://customer.default.svc.cluster.local:5000
      curl -s http://product.default.svc.cluster.local:5000
      watch -t -n 1 curl -s http://order.default.svc.cluster.local
      
      
                 
      ```


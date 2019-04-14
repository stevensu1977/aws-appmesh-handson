#App Mesh hands-on

##2019/04/2
 
###Lab01 创建EKS 集群

   * 使用weaveworks开发的第三方工具[eksctl](https://github.com/weaveworks/eksctl)创建EKS集群
  
   * 创建EKS 集群需要一定时间请耐心,等待脚本执行完毕
   
   ![screenshot-01](https://github.com/stevensu1977/aws-appmesh-handson/blob/master/screenshot/lab01-1.gif?raw=true)
   
   ![screenshot-02](https://github.com/stevensu1977/aws-appmesh-handson/blob/master/screenshot/lab01-2.png?raw=true)
   
   
   * 定制EKS集群环境变量参数
      * AWS_REGION //默认是us-west-2
      * EKS_NAME //EKS Cluster 集群,默认是jani-mi2-demo
      * NODE_COUNT //EKS 节点数量,默认是1
      * NODE_TYPE  //EKS 节点类型,默认是t2 t2.medium
      
   * 如果有错误请检查是否有正确的权限, access key/secret access key
     
      ```bash
        #创建EKS集群需要一定时间,建议事先创建好
        cd lab01
        ./launch-cluster.sh
        
        #创建完成后eksctl会自动生成默认的kubectl访问信息
        #可以直接使用kubectl 访问EKS集群
        #查看节点信息
        kubectl get node
        
        
      ```     

  
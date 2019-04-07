#App Mesh hands-on

##2019/04/2
 
###Lab01 创建EKS 集群

   * 定制环境变量参数
      * AWS_REGION //默认是us-west-2
      * EKS_NAME //EKS Cluster 集群,默认是jani-mi2-demo
      * NODE_COUNT //EKS 节点数量,默认是1
      * NODE_TYPE  //EKS 节点类型,默认是t2 t2.medium
      
   * 如果有错误请检查是否有正确的权限, access key/secret access key
     
      ```bash
        #创建EKS集群需要一定时间,可以事先创建好
        cd lab01
        ./launch-cluster.sh
        
        #创建完成后使用kubectl 查看节点信息
        kubectl get node
        
        
      ```     

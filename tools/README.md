#App Mesh hands-on

##2019/04/2
 
###tools脚本说明

   * EKS定制环境变量参数
      * AWS_REGION //默认是us-west-2
      * EKS_NAME //EKS Cluster 集群,默认是jani-mi2-demo
      * NODE_COUNT //EKS 节点数量,默认是1
      * NODE_TYPE  //EKS 节点类型,默认是t2 t2.medium
    
   * AppMesh定制环境变量参数
      * AWS_REGION //默认是us-west-2
      * APPMESH_NAME //默认是shopmesh
      
   * delete-mesh.sh #删除所有服务virtual node, virtual route, virtual service , 以及mesh 实例

   * remove-deploys.sh #从EKS集群上删除所有deploy
 
   * delete-cluster.sh #删除EKS集群
    

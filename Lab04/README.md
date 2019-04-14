#App Mesh hands-on

##2019/04/2
 
### Lab04 部署customer/product 服务新版本

   * 实验内容: 使用kubectl向EKS集群部署 customer v1.5 ,product v2.0 版本，并使用aws cli更新AppMesh的路由规则.
    
   ```bash
     
     cd lab04
    
     #部署customer V15到EKS集群
     ./deploy-customer-v15.sh
     
     #更新mesh 路由
     #1. 创建一个新的virtual node 指向v15
     #2. 更新路由，weight v1,v15各50%
     ./update-mesh-customer-v15.sh
     
    
    #部署product V2到EKS集群
    ./deploy-product-v2.sh
     
    #同customer ,更新mesh 路由
    ./update-mesh-product-v2.sh
    
    
    #注意上面curl客户端的输出
     
   ```  


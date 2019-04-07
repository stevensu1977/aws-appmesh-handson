#App Mesh hands-on

##2019/04/2
 
###Lab02 创建Mesh
   
   

   * Tips: 
       * 目前appmesh只接受json格式( --cli-input-json),
    但是可以通过--generate-cli-skeleton 获得基本模版
       * 要创建vitrual service ! 不然默认的pods是无法通信的
       
       ```bash
       cd lab02
       #创建之前可以使用 ../tools/delete-mesh.sh 确保环境干净
       ./create_mesh.sh
       
       
       ```

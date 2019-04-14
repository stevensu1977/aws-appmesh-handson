apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: product
spec:
  replicas: 1
  template:
    metadata:
      labels:
        microsvc: product
    spec:
      containers:
      - name: product
        image: janakiramm/service
        imagePullPolicy: Always
        env:       
        - name: "SVC_NAME"
          value: "Product"                  
        - name: "SVC_VER"
          value: "1.0"                  
        ports:
        - name: product
          containerPort: 5000
      - name: envoy
        image: 111345817488.dkr.ecr.us-west-2.amazonaws.com/aws-appmesh-envoy:v1.9.0.0-prod
        securityContext:
          runAsUser: 1337
        env:
          - name: "APPMESH_VIRTUAL_NODE_NAME"
            value: "mesh/shopmesh/virtualNode/product-vn"
          - name: "ENVOY_LOG_LEVEL"
            value: "info"
          - name: "AWS_REGION"
            value: "%ENV_AWS_REGION%"
      initContainers:
        - name: proxyinit
          image: 111345817488.dkr.ecr.us-west-2.amazonaws.com/aws-appmesh-proxy-route-manager:latest
          securityContext:
            capabilities:
              add: 
                - NET_ADMIN
          env:
            - name: "APPMESH_START_ENABLED"
              value: "1"
            - name: "APPMESH_IGNORE_UID"
              value: "1337"
            - name: "APPMESH_ENVOY_INGRESS_PORT"
              value: "15000"
            - name: "APPMESH_ENVOY_EGRESS_PORT"
              value: "15001"
            - name: "APPMESH_APP_PORTS"
              value: "5000"
            - name: "APPMESH_EGRESS_IGNORED_IP"
              value: "169.254.169.254"          
---          
apiVersion: v1
kind: Service
metadata:
  name: product
  labels:
    microsvc: product
spec:
  selector:
    microsvc: product
  type: ClusterIP
  ports:
   - port: 5000
     name: http
     targetPort: 5000
     protocol: TCP 

apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: order
spec:
  replicas: 1
  template:
    metadata:
      labels:
        microsvc: order
    spec:
      containers:
      - name: order
        image: janakiramm/order
        imagePullPolicy: Always
        env:       
        - name: "CUST_SVC_URL"
          value: "http://customer.default.svc.cluster.local:5000"
        - name: "PROD_SVC_URL"
          value: "http://product.default.svc.cluster.local:5000"
        - name: "SVC_NAME"
          value: "Order"        
        - name: "SVC_VER"
          value: "1.0"        
        ports:
        - name: order-port
          containerPort: 5000
      - name: envoy
        image: 111345817488.dkr.ecr.us-west-2.amazonaws.com/aws-appmesh-envoy:v1.9.0.0-prod
        securityContext:
          runAsUser: 1337
        env:
          - name: "APPMESH_VIRTUAL_NODE_NAME"
            value: "mesh/shopmesh/virtualNode/order-vn"
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
  name: order
  labels:
    microsvc: order
spec:
  selector:
    microsvc: order
  type: LoadBalancer
  ports:
   - port: 80
     name: http
     targetPort: 5000
     protocol: TCP 

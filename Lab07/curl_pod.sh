kubectl -n appmesh-demo delete deploy/curler
kubectl -n appmesh-demo run -it curler --image=tutum/curl -- bash
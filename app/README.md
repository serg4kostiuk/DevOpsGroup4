#create & deploy pods \n
1.kubectl apply -f deployment file\n
  1a.deployment.extensions/kube-for-app created \n
2.kubectl apply -f service file \n
  2a.service.extensions/kube-for-app created\n
3.verify that pods created & running \n
  3a.kubectl get pods \n
4.kubectl apply -f ingress(like loadBalancer) file \n
  4a. ingress.extensions/kube-for-app-ingress created\n
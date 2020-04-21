#create & deploy pods
1.kubectl apply -f deployment file
  1a.deployment.extensions/kube-for-app created -//-
2.kubectl apply -f service file
  2a.service.extensions/kube-for-app created
3.verify that pods created & running
  3a.kubectl get pods
4.kubectl apply -f ingress(like loadBalancer) file
  
#create & deploy pods
1.kubectl apply -f deployment file <br />
  1a.deployment.extensions/kube-for-app created -//- <br />
2.kubectl apply -f service file <br />
  2a.service.extensions/kube-for-app created <br />
3.verify that pods created & running <br />
  3a.kubectl get pods <br />
4.kubectl apply -f ingress(like loadBalancer) file <br />
  

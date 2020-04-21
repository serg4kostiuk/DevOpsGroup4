#test, creating pods & deploy in pods
1.kubectl apply -f deploiyment file
  1a."deployment.extensions/kube-for-app created" -//-
2.kubectl apply -f service file
  2a.service/kube-for-app created
3.verify than pods creating & running
  3a. kubectl get pods
  3b.kubectl apply -f ingress file
    3b1.-//-
4.that's all now
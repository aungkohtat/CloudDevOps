# Using Prometheus & Grafana to monitor in Kubernetes

![](/Using-Prometheus-and-Grafana/images/1_R0ltLPWJRdzgGf5mzQgOwQ.png)

Here the monitoring tools are installed in the Kind cluster through the Helm chart. For that please follow the below steps

1. Installing prometheus and grafana.

Step 1

- Add [Prometheus and Grafana community repo](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/README.md). For this use the cmd:


## 1. Installing prometheus and grafana.
Step 1

- Add [Prometheus and Grafana community repo](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/README.md). For this use the cmd:

```

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
```
helm repo update
helm repo list
```
Step 2

- Install helm chart
```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ helm repo list
NAME                    URL                                               
prometheus-community    https://prometheus-community.github.io/helm-charts
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ helm install prometheus-community prometheus-community/kube-prometheus-stack --namespace prometheus-grafana --create-namespace
NAME: prometheus-community
LAST DEPLOYED: Mon Aug 12 18:39:41 2024
NAMESPACE: prometheus-grafana
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running:
  kubectl --namespace prometheus-grafana get pods -l "release=prometheus-community"

Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ 
```

Step 3

- Access Grafana

```
kubectl get services -n prometheus-grafana
```
Now you will see prometheus-grafana svc, that is the data visualization for Prometheus data

```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ kubectl get services -n prometheus-grafana
NAME                                            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
alertmanager-operated                           ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   107s
prometheus-community-grafana                    ClusterIP   10.123.66.226    <none>        80/TCP                       2m25s
prometheus-community-kube-alertmanager          ClusterIP   10.123.72.135    <none>        9093/TCP,8080/TCP            2m25s
prometheus-community-kube-operator              ClusterIP   10.123.114.192   <none>        443/TCP                      2m25s
prometheus-community-kube-prometheus            ClusterIP   10.123.81.100    <none>        9090/TCP,8080/TCP            2m25s
prometheus-community-kube-state-metrics         ClusterIP   10.123.173.249   <none>        8080/TCP                     2m25s
prometheus-community-prometheus-node-exporter   ClusterIP   10.123.224.79    <none>        9100/TCP                     2m25s
prometheus-operated                             ClusterIP   None             <none>        9090/TCP                     106s
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ 
```

Step 4

- As you can see all the services are ClusterIP type which is the internal service, so they are not open to external requests. So usually in production, we will configure ingress and point it to prometheus-grafana ,In this setup, we are going to access grafana using port-forward, Now we need to know in which port is grafana is running ,**kubectl get pods -n prometheus-grafana**

```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ kubectl get pods -n prometheus-grafana
NAME                                                       READY   STATUS    RESTARTS   AGE
alertmanager-prometheus-community-kube-alertmanager-0      2/2     Running   0          3m24s
prometheus-community-grafana-cdf5d5c6f-jcxvs               3/3     Running   0          4m3s
prometheus-community-kube-operator-59bdd65d6d-l55gd        1/1     Running   0          4m3s
prometheus-community-kube-state-metrics-585b7445fc-js9lx   1/1     Running   0          4m3s
prometheus-community-prometheus-node-exporter-75d4l        1/1     Running   0          4m3s
prometheus-community-prometheus-node-exporter-knftf        1/1     Running   0          4m3s
prometheus-community-prometheus-node-exporter-lhzw7        1/1     Running   0          4m3s
prometheus-community-prometheus-node-exporter-mbnqr        1/1     Running   0          4m3s
prometheus-prometheus-community-kube-prometheus-0          2/2     Running   0          3m24s
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ 

```
Step 5

Let’s check the port were the grafana is running

```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ kubectl logs prometheus-community-grafana-cdf5d5c6f-jcxvs -c grafana -n prometheus-grafana | grep 3000
logger=http.server t=2024-08-12T18:41:04.563380878Z level=info msg="HTTP Server Listen" address=[::]:3000 protocol=http subUrl= socket=
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ 
```

kubectl get all -n prometheus-grafana

```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ kubectl get all -n prometheus-grafana
NAME                                                           READY   STATUS    RESTARTS   AGE
pod/alertmanager-prometheus-community-kube-alertmanager-0      2/2     Running   0          6m56s
pod/prometheus-community-grafana-cdf5d5c6f-jcxvs               3/3     Running   0          7m35s
pod/prometheus-community-kube-operator-59bdd65d6d-l55gd        1/1     Running   0          7m35s
pod/prometheus-community-kube-state-metrics-585b7445fc-js9lx   1/1     Running   0          7m35s
pod/prometheus-community-prometheus-node-exporter-75d4l        1/1     Running   0          7m35s
pod/prometheus-community-prometheus-node-exporter-knftf        1/1     Running   0          7m35s
pod/prometheus-community-prometheus-node-exporter-lhzw7        1/1     Running   0          7m35s
pod/prometheus-community-prometheus-node-exporter-mbnqr        1/1     Running   0          7m35s
pod/prometheus-prometheus-community-kube-prometheus-0          2/2     Running   0          6m56s

NAME                                                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/alertmanager-operated                           ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   6m57s
service/prometheus-community-grafana                    ClusterIP   10.123.66.226    <none>        80/TCP                       7m35s
service/prometheus-community-kube-alertmanager          ClusterIP   10.123.72.135    <none>        9093/TCP,8080/TCP            7m35s
service/prometheus-community-kube-operator              ClusterIP   10.123.114.192   <none>        443/TCP                      7m35s
service/prometheus-community-kube-prometheus            ClusterIP   10.123.81.100    <none>        9090/TCP,8080/TCP            7m35s
service/prometheus-community-kube-state-metrics         ClusterIP   10.123.173.249   <none>        8080/TCP                     7m35s
service/prometheus-community-prometheus-node-exporter   ClusterIP   10.123.224.79    <none>        9100/TCP                     7m35s
service/prometheus-operated                             ClusterIP   None             <none>        9090/TCP                     6m56s

NAME                                                           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/prometheus-community-prometheus-node-exporter   4         4         4       4            4           kubernetes.io/os=linux   7m35s

NAME                                                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/prometheus-community-grafana              1/1     1            1           7m35s
deployment.apps/prometheus-community-kube-operator        1/1     1            1           7m35s
deployment.apps/prometheus-community-kube-state-metrics   1/1     1            1           7m35s

NAME                                                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/prometheus-community-grafana-cdf5d5c6f               1         1         1       7m35s
replicaset.apps/prometheus-community-kube-operator-59bdd65d6d        1         1         1       7m35s
replicaset.apps/prometheus-community-kube-state-metrics-585b7445fc   1         1         1       7m35s

NAME                                                                   READY   AGE
statefulset.apps/alertmanager-prometheus-community-kube-alertmanager   1/1     6m57s
statefulset.apps/prometheus-prometheus-community-kube-prometheus       1/1     6m56s
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ 
```

Step 6

Port-Forward

```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ kubectl port-forward deployment.apps/prometheus-community-grafana -n prometheus-grafana 3000
Forwarding from 127.0.0.1:3000 -> 3000
Forwarding from [::1]:3000 -> 3000
```

Step 7

- Now open a web browser and connect to localhost:3000.

http://192.168.56.85:3000/login (Vagrant Box IP)

![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%201.58.35 AM.png)


Step 8

Provide username and password.

Default username is admin and the password you can find on the chart (prom-operator).

Step 9

After logging in click on home > Dashboards. Then you can see the data that Prometheus is already collecting.

## Deploy purchase-history-v1.yaml to test monitoring

```
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ kubectl get pod -n prometheus-grafana
NAME                                                       READY   STATUS    RESTARTS      AGE
alertmanager-prometheus-community-kube-alertmanager-0      2/2     Running   2 (35m ago)   49m
prometheus-community-grafana-cdf5d5c6f-jcxvs               3/3     Running   3 (35m ago)   50m
prometheus-community-kube-operator-59bdd65d6d-l55gd        1/1     Running   2 (35m ago)   50m
prometheus-community-kube-state-metrics-585b7445fc-js9lx   1/1     Running   2 (35m ago)   50m
prometheus-community-prometheus-node-exporter-75d4l        1/1     Running   1 (35m ago)   50m
prometheus-community-prometheus-node-exporter-knftf        1/1     Running   1 (35m ago)   50m
prometheus-community-prometheus-node-exporter-lhzw7        1/1     Running   1 (35m ago)   50m
prometheus-community-prometheus-node-exporter-mbnqr        1/1     Running   1 (35m ago)   50m
prometheus-prometheus-community-kube-prometheus-0          2/2     Running   2 (35m ago)   49m
vagrant@cloud-native-box:~/CloudDevOps/Using-Prometheus-and-Grafana$ 
```



Step 10

- Access Prometheus

We can also access them using the port-forward

```
kubectl port-forward pod/prometheus-prometheus-community-kube-prometheus-0 --address 0.0.0.0 9090 -n prometheus-grafana

```
![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%203.01.38 AM.png)

Step 11

Here you have the Prometheus UI were you can also display the alerts, configuration, which metric endpoints are been executed and you can also use PromQL language to query different kinds of stuff.

![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%203.07.23 AM.png)

![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%203.08.47 AM.png)
![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%203.09.03 AM.png)
![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%203.09.20 AM.png)
![](/Using-Prometheus-and-Grafana/images/Screenshot%202024-08-13%20at%203.09.39 AM.png)


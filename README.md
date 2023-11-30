# Kubernetes-in-Docker
> Everything running in KinD
### [Bastion Host with Docker in Docker(dind)](bastion-host.txt)
> Isolated docker server to run KinD
### [Kubernetes in Docker](kind.txt)
> Run the local kubernetes(kind) on any linux docker server or DinD
### [Minio S3 Object Store](minio.txt)
> Needed for Tempo, Loki and GitLab CI Runners
### [Grafana](grafana.txt)
> Needed for Prometheus Operator, Tempo and Loki
### [Prometheus Operator](prometheus-operator.txt)
> Metrics from applications
### [Grafana Tempo + OTEL Collector](tempo.txt)
> Open Telemetry Traces from applications
### [Grafana Loki + Promtail](loki.txt)
> Logs from applications
### [Java Demo App](demo-app.txt)
> [Deployment](deployment.yaml) to test Metrics, Traces and Logs
### [GitLab Server](gitlab.txt)
> Git, Pipelines, Container Registry etc.
### [GitLab CI Runner](gitlab-runner.txt)
> Run GitLab CI Jobs in Kubernetes
### [Rancher Server](rancher.txt)
> Basic Rancher Server
### [DinD in Kubernetes](dind.txt)
> Can be used as a central docker server to build images from GitLab CI
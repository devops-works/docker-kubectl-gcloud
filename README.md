# kubegcp

`kubegcp` is a simple Docker image bundling `kubectl` and `gcloud` together in order to query a GKE cluster within Docker.

## Usage

Best way to use it is to mount your Kubernetes and Gcloud client configuration, read-only, on the container to authenticate with the same profiles than locally.

### Examples

Expose a Kubernetes service locally from Docker, using local credentials

```
docker run -it --rm --name remote-elastic \
  -v ~/.kube:/.kube/:ro \
  -v ~/.config/gcloud:/.config/gcloud/:ro \
  devopsworks/kubegcp \
  port-forward -n mypromanv2 svc/elasticsearch 9200:9200 --context proman-staging-v2 --address='0.0.0.0'
```

## TODO

- [ ] Try to reduce image size by removing unnecessary libraries

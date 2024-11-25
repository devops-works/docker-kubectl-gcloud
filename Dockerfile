FROM bitnami/kubectl:1.30.5

USER root

RUN apt-get update && apt-get -y --no-install-recommends install curl gnupg2 && \
    # Add Google GPG key
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
      | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    # Add Google deb repo
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
      | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    # Install gcloud CLI
    apt-get update && apt-get install -y --no-install-recommends \
      google-cloud-cli \
      google-cloud-cli-gke-gcloud-auth-plugin && \
    # Cleanup
    apt-get remove -y curl gnupg2 && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

FROM reliefmelone/oc-cli-container:latest

LABEL maintainer=relief.melone@gmail.com
LABEL description="Additional Helm Feature included to base image"

USER root

# Install Curl
RUN apt-get install curl -y

# Install Helm
RUN curl https://helm.baltorepo.com/organization/signing.asc | sudo apt-key add - && \
    apt-get install apt-transport-https --yes && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update -y && \
    apt-get install -y helm

# Switch to regular user again
USER 1001
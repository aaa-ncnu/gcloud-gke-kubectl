FROM google/cloud-sdk:alpine
RUN apk --update add bash
RUN gcloud components install kubectl
COPY bin/kubectl.sh /kubectl.sh
COPY python/run_commands.py /run_commands.py
ENTRYPOINT /kubectl.sh

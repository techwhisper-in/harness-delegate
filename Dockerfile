FROM harness/delegate:24.07.83606
USER root
RUN microdnf update && microdnf install --nodocs unzip yum-utils
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && microdnf install -y terraform
RUN microdnf install -y docker
RUN microdnf install -y zip unzip
RUN dnf install -y python3.12
RUN microdnf install -y iputils
RUN microdnf install -y zip unzip
RUN dnf install -y python3.12-pip
RUN pip3 install boto3
RUN pip3 install pandas
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN mkdir /opt/harness-delegate/tools && cd /opt/harness-delegate/tools && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl
ENV PATH=/opt/harness-delegate/tools/:$PATH
USER harness

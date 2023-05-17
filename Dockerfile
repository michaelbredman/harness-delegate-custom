FROM harness/delegate:22.10.77029.minimal  
USER root  
  
RUN microdnf update \  
  && microdnf install --nodocs \  
    unzip \  
    yum-utils  
  
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \  
  && microdnf install -y terraform     
  
RUN mkdir /opt/harness-delegate/tools && cd /opt/harness-delegate/tools \  
  && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl   
  
ENV PATH=/opt/harness-delegate/tools/:$PATH  


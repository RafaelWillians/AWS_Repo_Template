FROM gitpod/workspace-full

RUN sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip -o awscliv2.zip \
    && sudo ./aws/install \
    && sudo apt-get update \      
    && sudo apt-get install -y gnupg software-properties-common curl \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && sudo apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && sudo apt-get install -y terraform
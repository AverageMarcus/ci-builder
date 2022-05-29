FROM ubuntu:21.10

RUN apt-get update -y
RUN apt-get install -y software-properties-common && \
  add-apt-repository ppa:longsleep/golang-backports && \
  apt-get update -y

RUN apt-get install -y \
  curl \
  build-essential \
  git \
  golang-go \
  unzip

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.24.0
RUN go install golang.org/x/lint/golint@latest
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl
RUN curl -LO https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip && unzip terraform_0.12.26_linux_amd64.zip -d /usr/local/bin && chmod +x /usr/local/bin/terraform && rm terraform_0.12.26_linux_amd64.zip

ENTRYPOINT [ "make" ]

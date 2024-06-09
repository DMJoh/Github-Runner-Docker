FROM ubuntu:22.04
ARG GITHUB_URL
ARG GITHUB_TOKEN
ARG RUNNER_NAME
ARG RUNNER_LABEL
WORKDIR /actions-runner
RUN apt update ; apt install wget rsync curl zip sudo -y ; curl -sSL https://get.docker.com/ | sh
RUN useradd -m runner && echo "runner:runner" | chpasswd && adduser runner sudo
RUN sudo usermod -aG docker runner
RUN echo "runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN wget -O runner.tar.gz $(curl -s https://api.github.com/repos/actions/runner/releases/latest | grep browser_download_url | cut -d\" -f4 | egrep 'linux-x64-[0-9.]+tar.gz$') && tar -xvf runner.tar.gz
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" ; unzip awscliv2.zip; sudo ./aws/install
RUN ./bin/installdependencies.sh
USER runner
COPY entrypoint.sh .
ENTRYPOINT [ "bash","entrypoint.sh" ]
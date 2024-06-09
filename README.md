## Github Runner in a Docker container 

For users without a github subscription or organisation account, it is impossible to use self-hosted runners for all repositories. So it will be a good idea to run runners as docker containers in a single instance.

### Get the latest runner image

Pull the latest image from Github Container Registry,

```bash
docker pull ghcr.io/dmjoh/github-runner:latest
```

### Activate the runner    

**Goto Repository > Settings > Actions > Runners**

Replace the values in `< >` with appropriate parameters from **Configure** block. See the screenshot below:   

![alt text](image.png)

Use the values from the above screenshot and create your runner.

```bash
docker run -it -d --name="<NAME_OF_PROJECT>" -e GITHUB_URL="<GITHUB_URL>" -e GITHUB_TOKEN="<TOKEN_FOR_RUNNER>" -e RUNNER_NAME="NAME_OF_THE_RUNNER" -e RUNNER_LABEL="<LABEL_NAME>" --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/dmjoh/github-runner:latest
```

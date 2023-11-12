# Python Pipeline
> Flask App Workflow using GitHub Actions and Terraform.

Test the code, build a Docker image, push to Docker Repo and deploy on a Azure VM instance.

### Prerequisites

- terraform (version used v0.13.4)
- Azure Account
- EC2 Instance running
- Docker Hub Repo

### Step 1: Sign in to Azure
bash
Copy code
az login

### Step 2: Set the Current Subscription
bash
Copy code
az account set --subscription "<subscription_id_or_subscription_name>"

### Step 3: Create a Service Principal
bash
Copy code
export MSYS_NO_PATHCONV=1 (for Git Bash users)
az ad sp create-for-rbac --name <service_principal_name> --role Contributor --scopes /subscriptions/<subscription_id>

### Step 4: Specify Service Principal Credentials in Environment Variables
Edit ~/.bashrc and add:

bash
Copy code
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
Execute source ~/.bashrc or . ~/.bashrc.

By following these steps, you authenticate, set the subscription, create a service principal, and configure environment variables for Azure, particularly useful for automation with tools like Terraform.

### On `settings/secrets`
```
HOST = ssh host
USERNAME = ssh user name
KEY = content of ssh private key (cat ./tf/private/key_access.pem)
DOCKER_USERNAME
DOCKER_PASSWORD
```

On `.github/workflow/push.yml`
```
image: docker-user/docker-repo
```

## Deploy infrastructure
```sh
./deploy.sh
```

### Connecting to your Linux instance using SSH
```sh
ssh -i ./tf/private/key_access.pem -A ubuntu@[instance IP]
```

## Destroy infrastructure
```sh
./down.sh
```

## Deploy CI/CD
On main branch...
```sh
git push
```

## Authors
* **Carlos Catalán** - [Github](https://github.com/catalan94)

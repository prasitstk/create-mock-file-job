# create-mock-file-job

This is a simple Docker project that run SSM Run Command to create a mock file into EC2 instances in a resource group

&nbsp;

### Create a new Amazon ECR private repository

Go to `AWS Console` (Select a region) > `Amazon ECR` > `Repositories` > `Private` > Press `Create repository` button > `Create repository` page.

Set up the repository as follows:
- Visibility settings = `Private`
- Repository name = `<aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com/create-mock-file-job`
- (Other settings are left default)

---
  
&nbsp;

## Build the Docker image

Build the Docker image locally by the following command:

```sh
# Make sure your current directory is on the same directory that the Dockerfile exist. Then:
docker build -t <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com/create-mock-file-job .
```

---

&nbsp;

### Run the Docker image locally

Run the Docker image locally to perform its task by:

```sh
docker run -e AWS_ACCESS_KEY_ID='<AWS_ACCESS_KEY_ID>' \
  -e AWS_SECRET_ACCESS_KEY='<AWS_SECRET_ACCESS_KEY>' \
  -e AWS_REGION='<AWS_REGION>' \
  -e RESOURCE_GRP_NAME='<RESOURCE_GRP_NAME>' \
  -e MOCK_CONTENT='<MOCK_CONTENT>' \
  --name create_mock_file_job
  <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com/create-mock-file-job \
  /app/run-ssm-cmd-to-create-mock-file.sh
```

Then remove the stopped container to clean up your local environment:

```sh
docker rm create_mock_file_job
```

---

&nbsp;

### Push the Docker image into the newly created Amazon ECR private repository

Push the Docker image to the remote repository by the following commands:

```sh
# Login the Amazon ECR with your temporarily credentials.
aws ecr get-login-password --region <aws-region> | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com

# Now you are allowed to push the Dokcer image to it.
docker push <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com/create-mock-file-job
```

---

FROM amazon/aws-cli:latest

RUN mkdir /app

COPY run-ssm-cmd-to-create-mock-file.sh /app

RUN chmod +x /app/*.sh

# Remove the entrypoint of the base image which is `aws` command
ENTRYPOINT []

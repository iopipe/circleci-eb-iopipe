FROM circleci/node:8.11.3

MAINTAINER dev@iopipe.com

RUN sudo apt-get update
RUN sudo apt-get install python-pip python-dev jq
RUN sudo pip install awscli

# Notes https://gist.github.com/RobertoSchneiders/9e0e73e836a80d53a21e
RUN set -x
RUN set -e

RUN sudo mkdir -p /home/ubuntu/.aws
RUN touch /home/ubuntu/.aws/config
RUN chmod 600 /home/ubuntu/.aws/config
RUN echo "[profile eb-cli]" > /home/ubuntu/.aws/config
RUN echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/ubuntu/.aws/config
RUN echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/ubuntu/.aws/config

FROM centos
ENV centos=python:3.8.0a4-alpine3.9


COPY httpd-foreground /usr/local/bin/

EXPOSE 80
CMD ["httpd-foreground"]
RUN curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O && chmod +x awslogs-agent-setup
RUN echo -e "[/var/log/apache2/access.log]\ state_file = /var/log/apache2/access.log\ log_group_name = log-docker " > /root/awslogs.conf
RUN mkdir -p /root/.aws && touch /root/.aws/credentials
RUN echo -e "[default]\ aws_access_key_id = AKIATMAG2QJAK4YKVNMW\ aws_secret_access_key = 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 " /root/.aws/credentials
RUN cd /root && python ./awslogs-agent-setup.py --region us-east-1 --non-interactive --configfile=/root/awslogs.conf
CMD [ "/var/awslogs/bin/aws","-D","FOREGROUND" ]
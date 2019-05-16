FROM centos
ENV centos=centos7
RUN yum install httpd httpd-tools -y && echo "My Website" >> /var/www/html/index.html
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm -y && yum install -y python36u python36u-libs python36u-devel python36u-pip -y
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py 

RUN curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O && chmod +x awslogs-agent-setup.py
RUN echo -e "[/var/log/apache2/access.log]\ state_file = /var/log/httpd/access.log\ log_group_name = log-docker " > /root/awslogs.conf
RUN mkdir -p /root/.aws && touch /root/.aws/credentials
RUN echo -e "[default]\ aws_access_key_id = AKIATMAG2QJAK4YKVNMW\ aws_secret_access_key = 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 " /root/.aws/credentials
RUN cd /root && python ./awslogs-agent-setup.py --region us-east-1 --non-interactive --configfile=/root/awslogs.conf
CMD [ "/var/awslogs/bin/aws","-D","FOREGROUND" ]
FROM centos
ENV centos=centos7
RUN yum install httpd  -y && echo "My Website" >> /var/www/html/index.html \
&& systemctl start httpd && systemctl enable httpd
EXPOSE 80 443
COPY httpd-foreground /usr/local/bin/
CMD [ "httpd-foreground" ]
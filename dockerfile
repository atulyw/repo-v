FROM centos
ENV centos=centos7
RUN yum install httpd httpd-tools -y && echo "My Website" >> /var/www/html/index.html \
EXPOSE 80 443
COPY httpd-foreground /usr/local/bin/
CMD [ "httpd-foreground" ]
FROM python
ENV python=python:3.8.0a4-alpine3.9
RUN yum install httpd httpd-tools -y && echo "My Website" >> /var/www/html/index.html
RUN 
EXPOSE 80 443
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
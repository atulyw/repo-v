FROM 
ENV centos=centos7
RUN yum install httpd httpd-tools -y && echo "My Website" >> /var/www/html/index.html
RUN 
EXPOSE 80 443
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
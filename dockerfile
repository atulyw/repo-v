FROM centos
ENV centos=centos7
RUN yum install httpd httpd-tools -y 
COPY /home/index.html /var/www/html/index.html
EXPOSE 80 443
COPY source dest
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
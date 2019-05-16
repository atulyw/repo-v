FROM centos
ENV centos=centos7
RUN yum install httpd httpd-tools -y 
COPY source dest 
EXPOSE 80 443
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
FROM python
ENV python=python:3.8.0a4-alpine3.9

EXPOSE 80 443
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
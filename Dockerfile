FROM centos:8

# Update repository URLs to use vault
RUN sed -i 's|mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-*.repo
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

# Install httpd
RUN yum install httpd -y

# Expose port 80
EXPOSE 80

# Start httpd
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

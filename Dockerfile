FROM centos:latest

MAINTAINER Jindřich Káňa <jindrich.kana@gmail.com>
LABEL Vendor="T-Mobile"

RUN yum install -y --setopt=tsflags=nodocs mariadb-server \
    && yum clean all

ADD https://raw.githubusercontent.com/tmobil-demo/dotaznik/master/db/setupdb.sh /opt
ADD https://raw.githubusercontent.com/tmobil-demo/dotaznik/master/db/my.cnf /etc
ADD https://raw.githubusercontent.com/tmobil-demo/dotaznik/master/db/setupdb.sql /opt

RUN mysql_install_db --user=mysql
RUN bash /opt/setupdb.sh

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]

FROM centos:centos6
MAINTAINER Darin London <darin.london@duke.edu>

RUN ["/usr/sbin/useradd", "bwa_user"]
RUN ["/usr/bin/yum", "install", "-y", "wget"]
ADD attribution.txt /home/bwa_user/attribution.txt
ADD download_data.sh /usr/local/bin/download_data.sh
RUN ["chown", "bwa_user", "/home/bwa_user/attribution.txt"]
RUN ["chmod", "777", "/usr/local/bin/download_data.sh"]
RUN ["mkdir","-p","/home/bwa_user/data"]
RUN ["chown","bwa_user","/home/bwa_user/data"]
RUN ["chgrp","bwa_user","/home/bwa_user/data"]
RUN ["chmod","777","/home/bwa_user/data"]
VOLUME ["/home/bwa_user/data"]
WORKDIR /home/bwa_user
USER bwa_user
CMD "/usr/local/bin/download_data.sh"

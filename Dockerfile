# Defines a fixed version for the minio/mc base tag
# to avoid problems with auto-updating mc when using latest tag.
# => This minio-mc-cron image has to be updated manually, 
# if newer mc version is needed!
# You can add a pr here to do that: https://github.com/vservtech/minio-mc-cron
ARG BASE_TAG

FROM minio/mc:${BASE_TAG}

# Doesn't work, probably no package manager installed
RUN yum install cronie

# COPY example-crontab /etc/cron.d/example-crontab
# To use this Image: 
# - bind-mount some folder into /etc/cron.d with custom crontabs
# - bind-mount all required scripts for these cronfiles into the container, 
#   for example to /scripts/

WORKDIR /minio-mc-cron
COPY src/init.sh ./

# Note: can't 
# RUN chmod -R 0644 /etc/cron.d/* 
# RUN crontab /etc/cron.d/*

ENTRYPOINT ["bash", "/minio-mc-cron/init.sh"]
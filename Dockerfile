# Defines a fixed version for the minio/mc base tag
# to avoid problems with auto-updating mc when using latest tag.
# => This minio-mc-cron image has to be updated manually, 
# if newer mc version is needed!
# You can add a pr here to do that: https://github.com/vservtech/minio-mc-cron
ARG BASE_TAG

FROM minio/mc:${BASE_TAG}
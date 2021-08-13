FROM alpine:3.14.1

ENV AWS_NUKE_VERSION="v2.15.0" \
    PYTHON3_VERSION="3.9.5-r1" \
    BOTO3_VERSION="1.17.105-r0"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /data

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="aws-nuke" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.14.1" \
      "org.label-schema.description"="aws-nuke in a container" \
      "org.label-schema.url"="https://github.com/rebuy-de/aws-nuke" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-private/docker-aws-nuke" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.aws-nuke.version"=$AWS_NUKE_VERSION \
      "org.label-schema.applications.python3.version"=$PYTHON3_VERSION \
      "org.label-schema.applications.boto3.version"=$BOTO3_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="See README.md"

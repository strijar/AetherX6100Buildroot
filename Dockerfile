# Base image (last LTS)
FROM ubuntu:latest

# Set apt-get to non-interactive
ARG DEBIAN_FRONTEND=noninteractive
# For when tzdata gets installed
ENV TZ=UTC

# Update the system
RUN apt-get update && apt-get upgrade -y

# Set the correct locale
RUN apt-get install -y locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install dependencies
RUN apt-get install -y git build-essential wget cpio unzip rsync bc \
    libncurses5 screen file cmake \
    python3 python3-dev python3-setuptools python3-pip \
    asciidoc flex bison coreutils gzip lzip tar make \
    xz-utils diffutils patch gzip bzip2 perl \
    bc findutils

# Make a working dir
WORKDIR /workspace

# Copy project files
COPY . ./

# Make entrypoint executable
RUN chmod +x entrypoint.sh

# Give it a (replaceable) entrypoint
ENTRYPOINT ["./entrypoint.sh"]

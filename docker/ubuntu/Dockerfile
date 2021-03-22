FROM ubuntu:20.04

# Update base system
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install git -y
RUN git clone -b development https://github.com/tatsontung/workstations-setup
RUN bash workstations-setup/install_linux -d ubuntu

# Install XVFB -> required for running chrome in mode frameless, which is required for document downloads
# Install Java -> for Selenium Standalone server

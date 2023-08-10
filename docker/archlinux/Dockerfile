FROM archlinux:base-devel

# Update base system
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git clone -b develop https://github.com/tatsontung/workstations-setup
RUN bash workstations-setup/install_linux -d archlinux

# Install XVFB -> required for running chrome in mode frameless, which is required for document downloads
# Install Java -> for Selenium Standalone server

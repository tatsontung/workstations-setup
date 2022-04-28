FROM ubuntu:18.04
USER root
RUN apt-get update && \
  apt-get -y install sudo
RUN useradd -m tatsontung && passwd -d tatsontung && adduser tatsontung sudo
#ADD /sudoers.txt /etc/sudoers
RUN chmod 440 /etc/sudoers
RUN cat /etc/sudoers
RUN touch /usr/lib/node_modules
RUN chmod 777 /usr/lib/node_modules
USER tatsontung
ENV home /home/tatsontung/workspace/workstations-setup
WORKDIR ${home}
ADD . $home
RUN cd $home
# RUN echo 'proxy = 172.17.0.1:3130' > ~/.curlrc
# RUN echo 'proxy = 172.17.0.1:3130' > ~/.wgetrc
# RUN cat ~/.curlrc
# RUN cat ~/.wgetrc
RUN ls -l
RUN pwd
ENV TERM=xterm
RUN bash $home/install_linux -d ubuntu -c external
# RUN cp $home/environments/linux/config/external/home.zshrc ~/.zshrc
# RUN bash $home/environments/linux/config/external/homeconfig.sh
# RUN bash $home/environments/linux/ubuntu/bootstrap.sh
# RUN bash $home/environments/linux/ubuntu/node.sh
# RUN bash $home/environments/linux/commons/apps.sh
# RUN bash $home/environments/linux/commons/config.sh
# RUN bash $home/environments/linux/commons/git.sh
# RUN bash $home/environments/linux/commons/zsh.sh
FROM runmymind/docker-android-sdk

# Setup rsync
RUN apt-get update && \
  apt-get install -y rsync

# Setup ssh server
RUN apt-get update && \
  apt-get install -y openssh-server && \
  mkdir /var/run/sshd && \
  echo 'root:taklkvaz12' |chpasswd && \
  sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
EXPOSE 22

# Add enviroments variable to ~/.bashrc to be visible from non interactive ssh bash connection
RUN echo export ANDROID_SDK=$ANDROID_SDK | cat - ~/.bashrc > temp && mv temp ~/.bashrc && \
  echo export ANDROID_SDK_HOME=$ANDROID_SDK_HOME | cat - ~/.bashrc > temp && mv temp ~/.bashrc && \
  echo export ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT | cat - ~/.bashrc > temp && mv temp ~/.bashrc && \
  echo export ANDROID_HOME=$ANDROID_HOME | cat - ~/.bashrc > temp && mv temp ~/.bashrc
  
CMD    ["/usr/sbin/sshd", "-D"]
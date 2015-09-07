FROM centos:centos7

MAINTAINER TAKEI Yuya <takei.yuya+docker@gmail.com>

RUN yum install -y @Development
RUN yum install -y vim-enhanced screen sudo
RUN yum install -y lsof curl nmap-ncat iproute psmisc procps-ng lsof bind-utils bridge-utils tar
RUN yum install -y python-devel ruby-devel lua-devel cscope
RUN yum install -y {glibc,zlib,openssl,readline,libxml2,expat,libtiff,libpng,libxslt,bzip2,xz,libyaml,libffi}-devel
RUN yum install -y {glibc,zlib,openssl,readline,libxml2,expat,libtiff,libpng}-static

RUN git clone https://github.com/sstephenson/rbenv.git      /opt/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
RUN ( \
  echo 'export RBENV_ROOT="/opt/rbenv"'; \
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"'; \
  echo 'eval "$(rbenv init -)"'; \
  ) >> /etc/skel/.bash_profile
RUN . /etc/skel/.bash_profile ; rbenv install 1.9.3-p551
RUN . /etc/skel/.bash_profile ; rbenv global 1.9.3-p551 ; gem install bundler --no-ri --no-rdoc ; rbenv rehash
RUN . /etc/skel/.bash_profile ; rbenv install 2.2.0
RUN . /etc/skel/.bash_profile ; rbenv global 2.2.0 ; gem install bundler --no-document ; rbenv rehash

RUN git clone git://github.com/yyuu/pyenv.git               /opt/pyenv
RUN ( \
  echo 'export PYENV_ROOT="/opt/pyenv"'; \
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"'; \
  echo 'eval "$(pyenv init -)"'; \
  ) >> /etc/skel/.bash_profile
RUN . /etc/skel/.bash_profile ; pyenv install anaconda-2.3.0
RUN . /etc/skel/.bash_profile ; pyenv install anaconda3-2.3.0
RUN . /etc/skel/.bash_profile ; pyenv global anaconda3-2.3.0

RUN yum install -y dbus

FROM centos:centos7

MAINTAINER TAKEI Yuya <takei.yuya+docker@gmail.com>

RUN yum install -y @Development
RUN yum install -y vim-enhanced screen
RUN yum install -y lsof curl nmap-ncat iproute psmisc procps-ng lsof bind-utils bridge-utils
RUN yum install -y python-devel ruby-devel lua-devel cscope zlib-devel bzip2-devel libyaml-devel openssl-devel

RUN ( \
  echo 'export PYENV_ROOT="$HOME/.pyenv"'; \
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"'; \
  echo 'eval "$(pyenv init -)"'; \
  ) >> ~/.bash_profile
RUN git clone git://github.com/yyuu/pyenv.git ~/.pyenv
RUN . ~/.bash_profile && pyenv install anaconda-2.3.0
RUN . ~/.bash_profile && pyenv install anaconda3-2.3.0

RUN ( \
  echo 'export RBENV_ROOT="$HOME/.pyenv"'; \
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"'; \
  echo 'eval "$(rbenv init -)"'; \
  ) >> ~/.bash_profile
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN . ~/.bash_profile && rbenv install -l

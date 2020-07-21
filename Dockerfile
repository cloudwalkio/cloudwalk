FROM scalone/cloudwalk-cli

#RUN gem install bundler
RUN apt-get update
RUN apt-get install -y linux-headers-generic libreadline-dev binutils-mingw-w64 mingw-w64-tools lib32readline-dev lib32ncurses5-dev
RUN apt-get install -y openssl build-essential libssl-dev libreadline-dev

ENV PATH="/usr/local/rvm/bin:/opt/osxcross/target/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV PATH="./mruby/build/x86_64-pc-linux-gnu/bin/:/home/mruby/.gem/bin:${PATH}"
ENV MRBC="/home/mruby/code/mruby/bin/mrbc"


# install RVM, Ruby, and Bundler
RUN /bin/bash -l -c "gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB"
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.4"
RUN /bin/bash -l -c "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "gem install archive-zip"
RUN /bin/bash -l -c "gem install rake -v=10.5.0"

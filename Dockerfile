FROM scalone/cloudwalk-cli

RUN gem install bundler
RUN apt-get install -y libreadline-dev binutils-mingw-w64 mingw-w64-tools lib32readline-dev

ENV PATH="./mruby/build/x86_64-pc-linux-gnu/bin/:/home/mruby/.gem/bin:${PATH}"
ENV MRBC="/home/mruby/code/mruby/bin/mrbc"

RUN gem install archive-zip

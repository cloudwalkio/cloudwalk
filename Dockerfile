FROM scalone/cloudwalk-cli

RUN gem install bundler

ENV PATH="./mruby/build/x86_64-pc-linux-gnu/bin/:/home/mruby/.gem/bin:${PATH}"
ENV MRBC="/home/mruby/code/mruby/bin/mrbc"

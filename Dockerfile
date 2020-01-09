FROM circleci/rust

RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.5/cmake-3.15.5-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && sudo mkdir /usr/bin/cmake \
      && sudo /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && sudo rm /tmp/cmake-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"

CMD ["/bin/sh"]
FROM debian

WORKDIR /home/lorcan

COPY ./ /opt/lorcan/dotfiles
RUN apt-get update \
  && apt-get install -y vim-nox tmux git pandoc \
  && useradd -s /bin/bash lorcan \
  && chown -R lorcan /home/lorcan
USER lorcan
RUN /opt/lorcan/dotfiles/bootstrap.sh
ENV TERM=screen-256color
CMD /bin/bash -l

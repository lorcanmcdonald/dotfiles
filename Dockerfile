FROM debian

WORKDIR /home/lorcan

COPY ./ /home/lorcan/dotfiles
RUN dotfiles/bootstrap.sh
RUN apt-get update && apt-get install -y vim tmux
ENV TERM=screen-256color

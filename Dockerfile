FROM jgillis/jupyter-octave:latest

USER root

ADD https://github.com/casadi/binaries/releases/download/commit-c97253f/casadi-linux-octave-4.2.2-e8ee7e1.tar.gz /tmp/octave.tar.gz
RUN chown $NB_USER:$NB_GID /tmp/octave.tar.gz

USER $NB_UID
RUN mkdir $HOME/casadi
RUN tar -xvf /tmp/octave.tar.gz -C $HOME/casadi
RUN rm /tmp/octave.tar.gz

RUN echo "addpath('$HOME/casadi');" > $HOME/.octaverc

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

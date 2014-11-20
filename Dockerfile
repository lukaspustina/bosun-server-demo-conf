FROM stackexchange/bosun
MAINTAINER lukas.pustin@codecentric.de

COPY supervisord.conf /etc/supervisor/conf.d/
COPY bosun.conf /bosun/

EXPOSE 8070 4242
CMD ["/usr/bin/supervisord"]


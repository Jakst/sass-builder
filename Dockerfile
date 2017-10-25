FROM ruby:2.4.2

MAINTAINER jakob.stahl@xlent.se

VOLUME /var/cache/sass

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]

CMD ["/usr/local/bundle/bin/sass",\
	"--cache-location", "/var/cache/sass",\
	"--compass",\
	"--poll",\
	"--require", "bootstrap-sass",\
	"--update", "${SASS_PATH}:${SASS_PATH}"]

RUN gem install listen:3.1.5 compass:1.0.3 bootstrap-sass:3.3.7

ADD entrypoint.sh /usr/local/sbin/

# Single-run shortcuts
ADD watch.sh /usr/local/bin/watch-sass
ADD watch.sh /usr/local/bin/watch-scss

RUN chmod a+rx /usr/local/sbin/entrypoint.sh /usr/local/bin/watch-* &&\
	echo PATH=/usr/local/bundle/bin/sass:$PATH > /etc/environment

FROM ruby:2.7.1

ENV REVIEWDOG_VERSION=v0.10.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN gem install \
  rake \
  -- --use-system-libraries

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rake", "html-proofer"]

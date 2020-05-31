FROM ruby:2.6.5
ENV LANG=en_US.UTF-8
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
EXPOSE 3000

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

WORKDIR /app
COPY Gemfile* ./
COPY package.json ./
COPY yarn.lock ./
RUN bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
RUN yarn install
COPY . .
RUN bundle exec rails assets:precompile

CMD [ "bundle", "exec", "puma" ]

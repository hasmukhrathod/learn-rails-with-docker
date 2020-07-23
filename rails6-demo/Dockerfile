From ruby:2.7.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

COPY . /usr/src/app/
WORKDIR /usr/src/app
ADD Gemfile  /usr/src/app/Gemfile 
ADD Gemfile.lock  /usr/src/app/Gemfile.lock

##install gems in the following directory
ENV BUNDLE_PATH /gems

##to solve error of yarn
RUN bundle config --delete without
RUN bundle config --delete with
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]


From ruby:2.7.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -y yarn
RUN apt-get install -yqq --no-install-recommends nodejs
RUN yarn install
COPY . /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

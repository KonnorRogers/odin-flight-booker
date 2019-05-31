# Pull in ruby 2.6.2 as specified in .ruby-version
FROM ruby:2.6.2

# Add yarn
ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# Adds nodejs 6.x +
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

RUN apt-get update -qq && apt-get -qq install -y build-essential nodejs yarn
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# create the working directory
RUN mkdir /myapp
# set the working directory
WORKDIR /myapp

# Move all items from current directory into myapp
COPY . /myapp
RUN gem install bundler
RUN bundle install
RUN yarn install

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

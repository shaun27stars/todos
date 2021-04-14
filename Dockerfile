# Use the Ruby 3.0.1 image from Docker Hub
# as the base image (https://hub.docker.com/_/ruby)
FROM ruby:3.0.1

# Use a directory called /code in which to store
# this application's files. (The directory name
# is arbitrary and could have been anything.)
ENV APP_HOME /app
WORKDIR $APP_HOME

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -fy ./google-chrome-stable_current_amd64.deb

ADD Gemfile* $APP_HOME/

# Run bundle install to install the Ruby dependencies.
RUN bundle install

ADD package.json yarn.lock $APP_HOME/
# Run yarn install to install JavaScript dependencies.
RUN yarn install --check-files

# Copy all the application's files into the /code
# directory.
ADD . $APP_HOME

ENTRYPOINT ["bundle", "exec"]
# Set "rails server -b 0.0.0.0" as the command to
# run when this container starts.
CMD ["rails", "server", "-b", "0.0.0.0"]
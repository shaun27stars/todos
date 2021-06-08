FROM engineyard/kontainers:ruby-2.7-v1.0.0

# An example of installing commonly-used packages
RUN apt-get update && apt-get install -y imagemagick libsqlite3-dev

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

ARG RAILS_ENV
# Copy the main application.
COPY . ./

# Install dependencies
RUN ./.eyk/bundler_install.sh
RUN bundle install --jobs 20 --retry 5

# Make the migration script runable
RUN chmod +x ./.eyk/migrations/db-migrate.sh

# Precompile Rails assets
RUN bundle exec rake assets:precompile

# Expose port 5000 to the Docker host, so we can access it
# from the outside. This is the same as the one set with
# "eyk config:set PORT 5000"
EXPOSE 5000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD sleep 3600
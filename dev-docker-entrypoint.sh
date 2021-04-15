#!/bin/sh

set -e

echo "Environment: $RAILS_ENV"

# install missing gems
bundle check || bundle install --jobs 20 --retry 5
yarn install --check-files
# Remove pre-existing puma/passenger server.pid
rm -f tmp/pids/server.pid

bundle exec rake db:create
bundle exec rake db:migrate

# run passed commands
bundle exec rails s -p 3000 -b '0.0.0.0'
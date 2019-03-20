FROM ruby:2.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production'

# saving
WORKDIR /tmp
RUN gem install bundler

# Update Node version
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/app
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Adding project files
#COPY . .
# RUN bundle exec rake assets:precompile, move this to cap tasks, this should be done in every deploy

EXPOSE 3000
#ENV RAILS_SERVE_STATIC_FILES=1
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

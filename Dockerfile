# Dockerfile
FROM ruby:3.3.6-slim

WORKDIR /app

# Install dependencies
RUN apt-get update -qq  \
    && \
    apt-get install -y build-essential libvips sqlite3 git nodejs npm && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN gem install bundler

# Cache bundle installs
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code
COPY . .

# Precompile bootsnap (optional)
RUN bundle exec bootsnap precompile --gemfile

# Expose port 3000 for Rails dev server
EXPOSE 3000

# Default command in dev: start a rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

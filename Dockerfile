# Dockerfile
FROM ruby:3.3.6-slim

# Set the working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libvips \
    sqlite3 \
    nodejs \
    npm  \
    ruby && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

# Install Bundler explicitly
RUN gem install bundler -v 2.4.22

# Cache Gem dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code into container
COPY . .

# Precompile assets and bootsnap (optional)
RUN bundle exec bootsnap precompile --gemfile || true

# Expose Rails server port
EXPOSE 3000

# Default command to run the server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

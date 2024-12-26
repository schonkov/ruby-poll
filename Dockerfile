# Base image
FROM ruby:3.3.6-slim

# Set working directory
WORKDIR /app

# Install only required system dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libvips \
    sqlite3 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

# Install Bundler
RUN gem install bundler -v 2.4.22

# Cache Gem dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=4 --retry=3

# Copy application code into container
COPY . .

# Expose Rails server port
EXPOSE 3000

# Start Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

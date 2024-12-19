# Dockerfile.dev - for development
FROM ruby:3.3.6-slim

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libvips sqlite3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Cache bundle installs
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code
COPY . .

# Precompile bootsnap (optional)
RUN bundle exec bootsnap precompile --gemfile

# In development, we won't precompile assets or enforce production settings.
# Expose port 3000 for Rails dev server
EXPOSE 3000

# Default command in dev: start a rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

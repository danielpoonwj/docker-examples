FROM ruby:2.7-slim

WORKDIR /app

# Install runtime dependencies
RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
      build-essential \
      sqlite3 \
      libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install gems
COPY Gemfile* ./
# prevent non-zero exit code if BUNDLE_PATH is not set
# https://github.com/docker-library/ruby/pull/306
# https://github.com/bundler/bundler/issues/6187
ENV BUNDLE_PATH="$GEM_HOME"
RUN bundle install --frozen --clean --jobs 4 --retry 3

EXPOSE 8080

# Copy application code
COPY . .

CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000" ]

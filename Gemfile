source "https://rubygems.org"

ruby "3.3.10"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
# gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'faraday'
gem 'dotenv-rails'


group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'webmock'
  gem 'vcr'
  gem 'simplecov', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end


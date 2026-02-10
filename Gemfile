source "https://rubygems.org"

ruby "3.3.10"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
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

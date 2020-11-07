# frozen_string_literal: true

source 'https://rubygems.org'

gem 'haml'
gem 'puma'
gem 'sinatra'
gem 'httpx'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
end

group :test do
  gem 'factory_bot'
  gem 'rspec'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'sinatra-contrib'
end

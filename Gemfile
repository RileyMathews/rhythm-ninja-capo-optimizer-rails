# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

group :development do
  gem 'rubocop'
  gem 'solargraph'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'pry'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

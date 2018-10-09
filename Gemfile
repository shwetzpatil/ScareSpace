# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.5.1'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'bcrypt'
gem 'pg'
gem 'rubocop'
gem 'sinatra'
gem 'sinatra-flash'

gem :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

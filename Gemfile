# frozen_string_literal: true
source 'https://rubygems.org'
ruby '2.3.1' # keep .ruby-version in sync with this

gem 'rake'
gem 'faraday'
gem 'typhoeus'
gem 'activesupport'

group :development do
  gem 'guard'
  gem 'guard-minitest'
end

group :test, :development do
  gem 'minitest'
  gem 'webmock'
  gem 'minitest-nyan-cat'
  gem 'rubocop', require: false
  gem 'byebug'
end

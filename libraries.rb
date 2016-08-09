# frozen_string_literal: true
ENV['NODE_ENV'] ||= 'development'
require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'
require 'byebug'
require 'json'
require 'pp'

require 'cli'
require 'parse_json'

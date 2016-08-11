# frozen_string_literal: true
ENV['NODE_ENV'] ||= 'development'
require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'
require 'byebug'
require 'active_support/all'

require 'json'
require 'pp'

require 'cli/operation'

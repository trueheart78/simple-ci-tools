# frozen_string_literal: true
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'concepts'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
ENV['NODE_ENV'] = 'production'

require 'libraries'

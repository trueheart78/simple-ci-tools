# frozen_string_literal: true
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
ENV['NODE_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/nyan_cat'

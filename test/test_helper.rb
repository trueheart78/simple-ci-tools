# frozen_string_literal: true
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'support'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
ENV['NODE_ENV'] = 'test'

require 'libraries'
require 'minitest/autorun'
require 'minitest/nyan_cat'
require 'webmock/minitest'

require 'fileutils'
require 'cli_test_skeleton'

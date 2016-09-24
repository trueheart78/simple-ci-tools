# frozen_string_literal: true
load_dirs = [
  '..',
  '../app/concepts',
  '../app/models',
  '.',
  'support',
  'shared'
]

load_dirs.each do |dir|
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), dir))
end
ENV['NODE_ENV'] = 'test'

require 'libraries'
require 'minitest/autorun'
# require 'minitest/nyan_cat'
require 'webmock/minitest'

require 'fileutils'
require 'cli_test_skeleton'

require 'aruba/cucumber'

VOLTEX_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
APP_NAME = 'test_app'
APP_ROOT = "#{VOLTEX_ROOT}/tmp/aruba/#{APP_NAME}"

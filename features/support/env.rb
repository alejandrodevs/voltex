require 'aruba/cucumber'

APP_NAME = 'test_app'
VOLTEX_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
APP_ROOT = "#{VOLTEX_ROOT}/tmp/aruba/#{APP_NAME}"

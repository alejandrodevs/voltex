require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 60 * 2
end

VOLTEX_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
APP_NAME = 'test_app'
APP_ROOT = "#{VOLTEX_ROOT}/tmp/aruba/#{APP_NAME}"

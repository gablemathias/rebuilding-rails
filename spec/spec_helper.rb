# frozen_string_literal: true
ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift File.expand_path("../lib",
__FILE__)

require "rulers"
require 'rack/test'

RSpec.configure do |config|
  # Include Rach::Test::Methods to be available to all spec contexts
  config.include Rack::Test::Methods
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

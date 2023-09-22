# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/array.rb"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      `echo debug > debug.txt`;

      status = 200
      headers = {'Content-Type' => 'text/html'}
      body = ["Hello from Ruby on Rulers! Did you see how amazing it is?"]

      [status, headers, body]
    end
  end
end

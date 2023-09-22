# frozen_string_literal: true

require_relative "rulers/version"

module Rulers
  class Error < StandardError; end
  
  class Application
    def call(env)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
      ["Hello from Ruby on Rulers! Did you see how amazing it is?"]]
    end
  end
end


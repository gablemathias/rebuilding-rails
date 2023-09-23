# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/array.rb"
require "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      # `echo debug > debug.txt`;
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)

      status = 200
      headers = {'Content-Type' => 'text/html'}
      body = ["Hello from Ruby on Rulers! Did you see how amazing it is?"]

      [status, headers, body]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end

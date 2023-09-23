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

      [status, headers, text]
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

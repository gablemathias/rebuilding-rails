# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {"Content-Type" => "text/html"}, []]
      end

      if env['PATH_INFO'] == '/'
        controller = HomeController.new(env)
        return [200, {'Content-Type' => 'text/html'}, [controller.send('index')]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text =
      begin
        [controller.send(act)]
      rescue
        return [500, {"Content-Type" => "text/html"}, []]
      end


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

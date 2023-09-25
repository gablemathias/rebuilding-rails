# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/array.rb"
require "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {"ContentType" => "text/html"}, []]
      end

      if env['PATH_INFO'] == '/'
        controller = QuotesController.new(env)
        return [200, {'ContentType' => 'text/html'}, [controller.send('a_quote')]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text =
      begin
        [controller.send(act)]
      rescue
        return [500, {"ContentType" => "text/html"}, []]
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

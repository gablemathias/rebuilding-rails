# frozen_string_literal: true

module Rulers
  class TestApp < Rulers::Application; end

  RSpec.describe Rulers do
    def app
      TestApp.new
    end

    it "successfully made a request" do
      get "/"

      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Hello")
    end

    it "doesn't have an empty body" do
      get "/"

      body = last_response.body

      expect(body).not_to be(body.empty?)
    end

    it "has a version number" do
      expect(Rulers::VERSION).not_to be nil
    end
  end
end

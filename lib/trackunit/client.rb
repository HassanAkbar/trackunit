require "trackunit/client/units"

module TrackUnit
  class Client
    include HTTParty
    include TrackUnit::Client::Units

    base_uri "https://api.trackunit.com/public"
    format :json

    def initialize(access_token = nil)
      access_token ||= ENV["TRACKUNIT_ACCESS_TOKEN"]
      self.class.default_options.merge!(default_params: { token: access_token })
    end

  end
end
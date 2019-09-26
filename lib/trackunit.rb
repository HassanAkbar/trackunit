require "active_support/core_ext/hash"
require "httparty"
require "trackunit/version"
require "trackunit/unit"
require "trackunit/client"
require "trackunit/resource"

module TrackUnit
  class Error < StandardError; end
  class AuthorizationError < Error; end
end

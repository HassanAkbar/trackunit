module TrackUnit
  class Resource < OpenStruct
    def self.serialize_response(response)
      binding.pry
      raise TrackUnit::Error if response.blank?
      raise TrackUnit::AuthorizationError.new(response.message) if response.code == 401
      raise TrackUnit::Error.new(response.message) unless response.code == 200

      serialized_data = []
      response.deep_transform_keys(&:underscore)['list'].each do |unit|
        serialized_data << new(unit)
      end
      serialized_data
    end
  end
end

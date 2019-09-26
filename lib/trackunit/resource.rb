module TrackUnit
  class Resource < OpenStruct
    def self.serialize_response(response)
      raise TrackUnit::AuthorizationError if response.blank?
      raise TrackUnit::Error.new(response) unless response.code == 200

      serialized_data = []
      response.deep_transform_keys(&:underscore)['list'].each do |unit|
        serialized_data << new(unit)
      end
      serialized_data
    end
  end
end

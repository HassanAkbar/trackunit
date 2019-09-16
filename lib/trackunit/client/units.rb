module TrackUnit
  class Client
    module Units
      def units(options = {})
        response = self.class.get("/unit")
        serialized_data = []
        response.deep_transform_keys(&:underscore)["list"].each do |unit|
          serialized_data << Unit.new(unit)
        end
        serialized_data
      end
    end
  end
end

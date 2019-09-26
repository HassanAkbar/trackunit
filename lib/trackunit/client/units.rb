module TrackUnit
  class Client
    module Units
      def units(options = {})
        response = self.class.get('/unit')
        Unit.serialize_response(response)
      end
    end
  end
end

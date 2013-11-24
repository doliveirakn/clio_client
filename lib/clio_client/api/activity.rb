module ClioClient
  module Api
    class Activity

      attr_accessor :api

      def initialize(api)
        self.api = api
      end

      def list
        response = api.get('activities')
        response["activities"].collect{|r| ClioClient::Activity.new(r) }
      end

    end
  end
end

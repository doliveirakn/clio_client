module ClioClient
  module Api
    class Base

      include Http
      include Authorization

      attr_accessor :access_token

      attr_writer :activities

      def initialize(credentials = {})
        self.access_token = credentials[:access_token]
      end

      def activities
        @activities ||= ClioClient::Api::Activity.new(self)
      end

    end
  end
end

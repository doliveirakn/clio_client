module ClioClient
  module Api
    class Base

      include Http
      include Authorization

      attr_accessor :access_token

      def initialize(credentials = {})
        self.access_token = credentials[:access_token]
      end

    end
  end
end

module ClioClient
  module Api
    class Base

      attr_accessor :session

      def initialize(session)
        self.session = session
      end

      private
      def data_item(params)
        data_klass(params).new(session, params)
      end

    end
  end
end

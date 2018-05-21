module ClioClient
  module Api
    class Calendar < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(*args)
        ClioClient::Calendar
      end

      def end_point_url;     'calendars';  end
      def plural_resource;   'data';   end
      def singular_resource; 'data';  end

    end
  end
end

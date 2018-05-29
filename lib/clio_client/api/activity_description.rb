module ClioClient
  module Api
    class ActivityDescription < Base

      include ClioClient::Api::Listable

      private
      def data_klass(*args)
        ClioClient::ActivityDescription
      end

      def end_point_url; 'activity_descriptions'; end
      def plural_resource; 'data'; end

    end
  end
end

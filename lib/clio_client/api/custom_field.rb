module ClioClient
  module Api
    class CustomField < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(*args)
        ClioClient::CustomField
      end

      def end_point_url;     'custom_fields';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';   end

    end
  end
end

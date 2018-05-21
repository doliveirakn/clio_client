module ClioClient
  module Api
    class CustomFieldSet < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(*args)
        ClioClient::CustomFieldSet
      end

      def end_point_url;     'custom_field_sets';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';   end

    end
  end
end

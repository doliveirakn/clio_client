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
      def plural_resource;   'custom_field_sets';  end
      def singular_resource; 'custom_field_set';   end

    end
  end
end

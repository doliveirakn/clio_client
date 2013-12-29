module ClioClient
  module Api
    class Document < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable

      private
      def data_klass(*args)
        ClioClient::Document
      end

      def end_point_url;     'documents';  end
      def plural_resource;   'documents';  end
      def singular_resource; 'document';   end

    end
  end
end

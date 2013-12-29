module ClioClient
  module Api
    class Note < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable


      private

      def data_klass(*args)
        ClioClient::Note
      end

      def end_point_url;     'notes';  end
      def plural_resource;   'notes';  end
      def singular_resource; 'note';   end

    end
  end
end

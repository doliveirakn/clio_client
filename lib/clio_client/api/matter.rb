module ClioClient
  module Api
    class Matter < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable


      private

      def data_klass(*args)
        ClioClient::Matter
      end

      def end_point_url;     'matters';  end
      def plural_resource;   'matters';  end
      def singular_resource; 'matter';   end

    end
  end
end

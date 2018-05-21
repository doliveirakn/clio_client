module ClioClient
  module Api
    class Group < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable


      private

      def data_klass(*args)
        ClioClient::Group
      end

      def end_point_url;     'groups';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';   end

    end
  end
end

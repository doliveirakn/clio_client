module ClioClient
  module Api
    class ClientConnectPermission < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable

      private
      def data_klass(*args)
        ClioClient::ClientConnectPermission
      end

      def end_point_url;     'client_connect_permissions';  end
      def plural_resource;   'client_connect_permissions';  end
      def singular_resource; 'client_connect_permission';   end

    end
  end
end

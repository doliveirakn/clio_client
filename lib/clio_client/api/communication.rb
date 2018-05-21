module ClioClient
  module Api
    class Communication < Base

      include ClioClient::Api::Crudable
      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(params)
        if params['type'] == 'PhoneCommunication'
          ClioClient::PhoneCommunication
        elsif params['type'] == 'EmailCommunication'
          ClioClient::EmailCommunication
        end
      end

      def end_point_url;     'communications';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';    end


    end
  end
end

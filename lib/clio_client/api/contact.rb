module ClioClient
  module Api
    class Contact < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable

      private
      def data_klass(attributes)
        accepted_types = %w(Person Company)
        type = attributes["type"] || attriutes[:type]
        if accepted_types.include? type
          ClioClient.const_get type
        else
          ClioClient::Contact
        end
      end

      def end_point_url;     'contacts';  end
      def plural_resource;   'contacts';   end
      def singular_resource; 'contact';  end

    end
  end
end

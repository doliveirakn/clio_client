module ClioClient
  module Api
    class Document < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable
      
      def upload(params = {})
        #response = session.post(end_point_url + "?fields=id,latest_document_version{uuid,put_url,put_headers}", {singular_resource => params}.to_json)
        response = session.post(end_point_url, {singular_resource => params}.to_json, true, {fields: "id,latest_document_version{uuid,put_url,put_headers}"})
        data_item(response[singular_resource])
      end

      private
      def data_klass(*args)
        ClioClient::Document
      end

      def end_point_url;     'documents';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';   end

    end
  end
end

module ClioClient
  module Api
    class Document < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable
      
      def upload(file, params = {})
        #file = File.read(file) if file.is_a? String
        #response = session.post(end_point_url + "?fields=id,latest_document_version{uuid,put_url,put_headers}", {singular_resource => params}.to_json)
        response = session.post(end_point_url, {singular_resource => params}.to_json, {fields: "id,latest_document_version{uuid,put_url,put_headers}"})
        uploaded_doc = data_item(response[singular_resource])
        begin
          if uploaded_doc.latest_document_version.present?
            uploaded_doc.latest_document_version.upload(uploaded_doc.id, file)
          end
        rescue => ex
          self.destroy(uploaded_doc.id)
          raise ex
        end
        
        uploaded_doc
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

module ClioClient
  module Api
    class Bill < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      
      def download(id)        
        session.get("#{end_point_url}/#{id}.pdf", {}, false)
      end
      
      private
      def data_klass(*args)
        ClioClient::Bill
      end

      def end_point_url;     'bills'; end
      def plural_resource;   'data'; end
      def singular_resource; 'data';  end

    end
  end
end

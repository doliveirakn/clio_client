module ClioClient
  module Api
    module Findable
      
      def find(id)
        begin
          response = session.get("#{end_point_url}/#{id}")
          data_item(response[singular_resource])
        rescue ClioClient::ResourceNotFound, ClioClient::UnknownResponse
          nil
        end
      end

    end
  end
end

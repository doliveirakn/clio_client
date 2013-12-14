module ClioClient
  module Api

    module Listable
      def list(params = {})
        @last_query = params
        @records = 0
        response = session.get(end_point_url, params)
        @next_offset = response["next_offset"]
        @records += response["records"]
        @total_records = response["total_records"]
        response[plural_resource].collect{ |r| data_item(r) }
      end

      def more_pages?
        @records < @total_records
      end
      
      def next_page
        params = @last_query.merge(:offset => @next_offset)
        response = session.get(end_point_url, params)
        @next_offset = response["next_offset"]
        @records += response["records"]
        response[plural_resource].collect{ |r| data_item(r) }        
      end

    end

  end
end

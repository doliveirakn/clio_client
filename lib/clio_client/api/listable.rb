module ClioClient
  module Api

    module Listable
      def list(params = {})
        response = api.get(end_point_url, params)
        response[plural_resource].collect{ |r| data_item(r) }
      end
    end

  end
end

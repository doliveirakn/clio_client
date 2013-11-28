module ClioClient
  module Api
    module Crud

      def api=(api); @api = api; end
      def api; @api; end

      def initialize(api)
        @api = api
      end

      def list(params = {})
        response = api.get(end_point, params)
        response[plural_resource].collect{ |r| data_item.new(self, r) }
      end

      def find(id)
        response = api.get("#{end_point}/#{id}")
        data_item.new(self, response[singular_resource])
      end

      def new(params = {})
        data_item.new(self, params)
      end

      def create(params = {})
        response = api.post(end_point, {singular_resource => params}.to_json)
        data_item.new(self, response[singular_resource])        
      end

      def update(id, params = {})
        response = api.put("#{end_point}/#{id}", {singular_resource => params}.to_json)
        data_item.new(self, response[singular_resource])        
      end

      def destroy(id)
        api.delete("#{end_point}/#{id}", false)
      end



    end
  end
end

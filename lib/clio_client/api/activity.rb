module ClioClient
  module Api
    class Activity

      attr_accessor :api

      def initialize(api)
        self.api = api
      end

      def list
        response = api.get('activities')
        response["activities"].collect{|r| ClioClient::Activity.new(r) }
      end

      def get(id)
        response = api.get("activities/#{id}")
        ClioClient::Activity.new(response["activity"])
      end

      def create(params = {})
        response = api.post("activities", {"activity" => params}.to_json)
        ClioClient::Activity.new(response["activity"])        
      end

      def update(id, params = {})
        response = api.put("activities/#{id}", {"activity" => params}.to_json)
        ClioClient::Activity.new(response["activity"])        
      end

      def delete(id)
        api.delete("activities/#{id}", false)
      end

    end
  end
end

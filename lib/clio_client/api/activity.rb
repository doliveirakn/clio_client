module ClioClient
  module Api
    class Activity

      attr_accessor :api

      def initialize(api)
        self.api = api
      end

      def list(params = {})
        response = api.get('activities', params)
        response["activities"].collect{ |r| create_time_or_expense_entry(r) }
      end

      def get(id)
        response = api.get("activities/#{id}")
        create_time_or_expense_entry(response["activity"])
      end

      def create(params = {})
        response = api.post("activities", {"activity" => params}.to_json)
        create_time_or_expense_entry(response["activity"])        
      end

      def update(id, params = {})
        response = api.put("activities/#{id}", {"activity" => params}.to_json)
        create_time_or_expense_entry(response["activity"])        
      end

      def delete(id)
        api.delete("activities/#{id}", false)
      end

      private
      def create_time_or_expense_entry(entry)
        if entry["type"] == "TimeEntry"
          ClioClient::TimeEntry.new(entry)
        else
          ClioClient::ExpenseEntry.new(entry)
        end        
      end

    end
  end
end

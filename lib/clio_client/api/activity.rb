module ClioClient
  module Api
    class Activity

      include ClioClient::Api::Crud



      private
      def data_item(params)
        if params['type'] == 'TimeEntry'
          ClioClient::TimeEntry.new(self, params)
        elsif params['type'] == 'ExpenseEntry'
          ClioClient::ExpenseEntry.new(self, params)
        end
      end

      def end_point_url;     'activities';  end
      def singular_resource; 'activity';    end
      def plural_resource;   'activities';  end

    end
  end
end

module ClioClient
  module Api
    class Activity < Base

      include ClioClient::Api::Crudable
      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_item(params)
        if params['type'] == 'TimeEntry'
          ClioClient::TimeEntry.new(session, params)
        elsif params['type'] == 'ExpenseEntry'
          ClioClient::ExpenseEntry.new(session, params)
        end
      end

      def end_point_url;     'activities';  end
      def singular_resource; 'activity';    end
      def plural_resource;   'activities';  end

    end
  end
end

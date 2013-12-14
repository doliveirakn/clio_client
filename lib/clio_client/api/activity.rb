module ClioClient
  module Api
    class Activity < Base

      include ClioClient::Api::Crudable
      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(params)
        if params['type'] == 'TimeEntry'
          ClioClient::TimeEntry
        elsif params['type'] == 'ExpenseEntry'
          ClioClient::ExpenseEntry
        end
      end

      def end_point_url;     'activities';  end
      def singular_resource; 'activity';    end
      def plural_resource;   'activities';  end

    end
  end
end

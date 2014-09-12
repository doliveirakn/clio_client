module ClioClient
  module Api
    class Activity < Base

      include ClioClient::Api::Crudable
      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(attributes)
        accepted_types = %w(TimeEntry ExpenseEntry)
        if accepted_types.include? attributes["type"]
          ClioClient.const_get attributes["type"].intern
        else
          ClioClient::Activity
        end
      end

      def end_point_url;     'activities';  end
      def plural_resource;   'activities';  end
      def singular_resource; 'activity';    end

    end
  end
end

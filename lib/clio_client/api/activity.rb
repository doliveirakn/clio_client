module ClioClient
  module Api
    class Activity < Base

      include ClioClient::Api::Crudable
      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      private
      def data_klass(attributes)
        accepted_types = %w(TimeEntry ExpenseEntry)
        type = attributes["type"] || attributes[:type]
        if accepted_types.include? type
          ClioClient.const_get type
        else
          ClioClient::Activity
        end
      end

      def end_point_url;     'activities';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';    end

    end
  end
end

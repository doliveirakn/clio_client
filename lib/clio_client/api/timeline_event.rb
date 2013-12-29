module ClioClient
  module Api
    class TimelineEvent < Base

      include ClioClient::Api::Listable

      private

      def data_klass(*args)
        ClioClient::TimelineEvent
      end

      def end_point_url;     'timeline_events';  end
      def plural_resource;   'timeline_events';  end
      def singular_resource; 'timeline_event';   end

    end
  end
end

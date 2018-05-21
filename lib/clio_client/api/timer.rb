module ClioClient
  module Api
    class Timer < Base

      def find
        response = session.get("#{end_point_url}")
        data_item(response[singular_resource])
      end

      def start(params = {})
        response = session.post(end_point_url, {singular_resource => params}.to_json)
        data_item(response[singular_resource])        
      end

      def stop
        session.delete("#{end_point_url}", false)
      end

      private

      def data_klass(*args)
        ClioClient::Timer
      end

      def end_point_url;     'timer';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';   end

    end
  end
end

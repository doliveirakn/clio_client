module ClioClient
  module Api
    class Activity

      include ClioClient::Api::Crud


      private
      def end_point;         'activities';  end
      def singular_resource; 'activity';    end
      def plural_resource;   'activities';  end

    end
  end
end

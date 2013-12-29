module ClioClient
  module Api
    class PracticeArea < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable
      include ClioClient::Api::Crudable


      private

      def data_klass(*args)
        ClioClient::PracticeArea
      end

      def end_point_url;     'practice_areas';  end
      def plural_resource;   'practice_areas';  end
      def singular_resource; 'practice_area';   end

    end
  end
end

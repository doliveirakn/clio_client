module ClioClient
  module Api
    class User < Base

      include ClioClient::Api::Listable
      include ClioClient::Api::Findable

      def avatar(id)
        session.get("#{end_point_url}/#{id}/avatar")
      end

      def who_am_i
        resp = session.get("#{end_point_url}/who_am_i",{fields: "id,name,email,first_name,last_name,account{id,etag,name}"})
        [ClioClient::Account.new(resp[singular_resource]["account"], session), 
         ClioClient::User.new(resp[singular_resource], session)]
      end
      

      private

      def data_klass(*args)
        ClioClient::User
      end

      def end_point_url;     'users';  end
      def plural_resource;   'data';  end
      def singular_resource; 'data';   end

    end
  end
end

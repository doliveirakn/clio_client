require "clio_client/api/http"
module ClioClient
  module Api
    class Base

      include Http
      
      def self.authorize_url(redirect_uri, state = nil)
        params = { response_type: :code, 
          client_id: "EG0fYOtoJq0AbTak3yXcXH4vui7okJM9ZJeQOxsU",
          redirect_uri: redirect_uri
        }
        params[:state] = state if state
        self.new.auth_uri(params).to_s
      end

      def initialize(credentials = {})
      end

    end
  end
end

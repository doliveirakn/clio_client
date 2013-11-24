module ClioClient
  module Api

    class Authorization


      def self.authorize_url(redirect_uri, state = nil)
        params = { response_type: :code, 
          client_id: "EG0fYOtoJq0AbTak3yXcXH4vui7okJM9ZJeQOxsU",
          redirect_uri: redirect_uri
        }
        params[:state] = state if state
        Http.new.base_uri("/oauth/authorize", params).to_s
      end

      def self.authorize_with_code(redirect_uri, code)
        params = { code: code,
          grant_type: "authorization_code",
          client_id: "EG0fYOtoJq0AbTak3yXcXH4vui7okJM9ZJeQOxsU",
          client_secret: "nvTS7gLkZladP0Z9TXWea6rzNujuKBoijoQIxePN",
          redirect_uri: redirect_uri
        }
        h = Http.new
        uri = h.base_uri("/oauth/token")
        req = Net::HTTP::Post.new(uri.request_uri)
        req.set_form_data params
        h.make_request(req, uri)
      end

      
    end
  end
end

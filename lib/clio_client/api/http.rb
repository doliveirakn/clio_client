module ClioClient
  module Api
   
    module Http

      def base_uri(path, query_values)
        uri = ::Addressable::URI.parse("https://app.goclio.com")
        uri.path = path
        uri.query_values = query_values
        uri
      end

      def auth_uri(params = {})
        base_uri("/oauth/authorize", params)
      end

    end
 
  end
end

module ClioClient
  module Api

    class Unauthorized < Exception; end
   
    module Http

      def base_uri(path, query_values = {})
        uri = URI.parse("https://app.goclio.com")
        uri.path = path
        uri.query = URI.encode_www_form(query_values) if query_values.any?
        uri
      end

      def get(path, parse=true)
        uri = base_uri("#{api_prefix}/#{path}")
        req = Net::HTTP::Get.new(uri.to_s)
        make_api_request(req, uri)
      end

      def make_api_request(req, uri, parse = true)
        return nil if self.access_token.nil? || self.access_token.empty?
        req.add_field("Authorization", "Bearer #{self.access_token}")
        make_request(req, uri, parse)
      end

      def make_request(req, uri, parse = true)
        req.add_field("Accept", "text/json")
        n = Net::HTTP.new(uri.host, uri.port)
        n.use_ssl = true
        res = n.start do |http|
          http.request(req)
        end
        case res
        when Net::HTTPSuccess
          parse ? JSON.parse(res.body) : res.body
        when Net::HTTPUnauthorized
          raise ClioClient::Api::Unauthorized
        else
          raise "Unknown #{res.class} response"
        end
      end

      private
      def api_prefix; "/api/v2"; end

    end
 
  end
end

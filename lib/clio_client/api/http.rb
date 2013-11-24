module ClioClient
  module Api
   
    class Http

      def base_uri(path, query_values = {})
        uri = URI.parse("https://app.goclio.com")
        uri.path = path
        uri.query = URI.encode_www_form(query_values)
        uri
      end

      
      def get(path, parse=true)
        req = Net::HTTP::Get.new(path)        
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
        end
      end

    end
 
  end
end

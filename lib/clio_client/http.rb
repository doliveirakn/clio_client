module ClioClient

  class Unauthorized < Exception; end 
  class ResourceNotFound < Exception; end
  
  module Http

    def base_uri(path, params = {})
      uri = URI.parse("https://app.goclio.com")
      uri.path = path
      uri.query = URI.encode_www_form(params) if params.any?
      uri
    end

    def get(path, params ={}, parse=true)
      uri = base_uri("#{api_prefix}/#{path}", params)
      req = Net::HTTP::Get.new(uri.to_s)
      make_api_request(req, uri)
    end

    def put(path, body = "", parse=true)
      uri = base_uri("#{api_prefix}/#{path}")        
      req = Net::HTTP::Put.new(uri.request_uri)
      req.body = body
      req.add_field("Content-Type", "application/json")
      make_api_request(req, uri, parse)
    end

    def multipart_post(path, params, parse = true)
      uri = base_uri("#{api_prefix}/#{path}")        
      req = Net::HTTP::Post::Multipart.new(uri.request_uri, params)
      make_api_request(req, uri, parse)
    end

    def post(path, body ="", parse = true)
      uri = base_uri("#{api_prefix}/#{path}")        
      req = Net::HTTP::Post.new(uri.request_uri)
      req.body = body
      req.add_field("Content-Type", "application/json")
      make_api_request(req, uri, parse)
    end

    def delete(path, parse=true)
      uri = base_uri("#{api_prefix}/#{path}")
      req = Net::HTTP::Delete.new(uri.request_uri)
      make_api_request(req, uri, parse)
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
      parse_response(res, parse)
    end

    def parse_response(res, parse)
      case res
      when Net::HTTPNotFound
        raise ClioClient::ResourceNotFound
      when Net::HTTPSuccess
        parse ? JSON.parse(res.body) : res.body
      when Net::HTTPUnauthorized
        raise ClioClient::Unauthorized
      else
        raise "Unknown #{res.class} response"
      end
    end

    private
    def api_prefix; "/api/v2"; end

  end
  
end

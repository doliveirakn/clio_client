module ClioClient

  class Session

    include Api::Http
    include Api::Authorization

    attr_accessor :access_token

    def initialize(credentials = {})
      self.access_token = credentials[:access_token]
    end

    def activities
      @activities ||= ClioClient::Api::Activity.new(self)
    end


  end

end

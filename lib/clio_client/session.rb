module ClioClient

  class Session

    include Api::Authorization

    attr_accessor :access_token

    def initialize(credentials = {})
      self.access_token = credentials[:access_token]
    end

    attr_writer :activities
    def activities
      @activities ||= ClioClient::Api::Activity.new
    end


  end

end

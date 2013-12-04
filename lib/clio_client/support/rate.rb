module ClioClient

  class Rate

    attr_accessor :rate
    attr_accessor :user_id
    attr_accessor :source
    attr_accessor :flat_rate

    def to_params
      {
        rate: rate.to_f, user_id: user_id.to_i,
        source: source.to_s, flat_rate: flat_rate
      }
    end


  end

end

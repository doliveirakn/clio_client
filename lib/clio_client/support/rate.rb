module ClioClient

  class Rate < Base

    set_attributes(rate:      {type: :decimal  },
                   user_id:   {type: :int      }, 
                   source:    {type: :string   }, 
                   flat_rate: {type: :boolean  } 
                   )

  end

end

module ClioClient

  class Reminder < Base

    set_attributes(minutes:  {type: :int     },
                   method:   {type: :string  }
                   )

  end

end

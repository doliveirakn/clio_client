module ClioClient

  class Reminder < Resource

    set_attributes(minutes:  {type: :int     },
                   method:   {type: :string  }
                   )

  end

end

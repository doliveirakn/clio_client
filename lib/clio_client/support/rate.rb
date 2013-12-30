module ClioClient

  class Rate < Resource
    set_attributes(id:                      {type: :int, readonly: true},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   rate:                    {type: :decimal},
                   source:                  {type: :string   }, 
                   flat_rate:               {type: :boolean},
                   user_id:                 {type: :int},
                   )


  end

end

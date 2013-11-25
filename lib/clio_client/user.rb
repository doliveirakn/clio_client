module ClioClient

  class User < Record
    
    attributes(id:                {type: :int, readonly: true},
               created_at:        {type: :datetime, readonly: true},
               updated_at:        {type: :datetime, readonly: true},
               subscription_plan: {type: :string, readonly: true},
               time_zone:         {type: :string, readonly: true},
               first_name:        {type: :string, readonly: true},
               last_name:         {type: :string, readonly: true}, 
               email:             {type: :string, readonly: true},
               enabled:           {type: :boolean, readonly: true},
               name:              {type: :string, readonly: true}
               )

  end

end

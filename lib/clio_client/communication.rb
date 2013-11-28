module ClioClient
  
  class Communication < Record

    set_attributes(id:          {type: :int, readonly: true},
                   type:        {type: :string, readonly: true},
                   created_at:  {type: :datetime, readonly: true},
                   updated_at:  {type: :datetime, readonly: true},
                   subject:     {type: :string},
                   body:        {type: :text},
                   date:        {type: :date},
                   matter:      {type: :hash},
                   senders:     {type: :array},
                   receivers:   {type: :array}                 
                   )

  end

end

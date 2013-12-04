module ClioClient
  class Calendar < Resource
    
    set_attributes(
                   id:                       {type: :int,      readonly: true},
                   created_at:               {type: :datetime, readonly: true},
                   updated_at:               {type: :datetime, readonly: true},
                   name:                     {type: :string                  },
                   permission:               {type: :string,   readonly: true}
                   )

    has_association      :matter,              ClioClient::Matter
    has_association      :calendar,            ClioClient::Calendar
    has_many_association :attending_calendars, ClioClient::Calendar

  end
end

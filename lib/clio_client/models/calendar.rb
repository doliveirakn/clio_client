module ClioClient
  class Calendar < Resource
    
    set_attributes(
                   id:                       {type: :int,      readonly: true},
                   type:                     {type: :string,   readonly: true},
                   created_at:               {type: :datetime, readonly: true},
                   updated_at:               {type: :datetime, readonly: true},
                   name:                     {type: :string                  },
                   color:                    {type: :string                  },
                   permission:               {type: :string,   readonly: true}
                   )

    private
    def api
      session.calendars
    end
  end
end

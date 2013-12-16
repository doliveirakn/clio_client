module ClioClient
  
  class ActivityDescription < Resource
    
    set_attributes(id:                      {type: :int, readonly: true},
                   name:                    {type: :string},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   activity_rate_default:   {type: :rate}
                   )

    has_many_association :rates,           ClioClient::Rate

    private
    def api
      session.activity_descriptions
    end

  end

end

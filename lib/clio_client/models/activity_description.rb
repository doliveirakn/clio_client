module ClioClient
  
  class ActivityDescription < Record
    
    set_attributes(id:    {type: :int, readonly: true},
                   name:  {type: :string}
                   created_at: {type: :datetime, readonly: true}
                   updated_at: {type: :datetime, readonly: true}
                   activity_rate_default: {type: :hash}, 
                   rates: {type: :array}
                   )

  end

end

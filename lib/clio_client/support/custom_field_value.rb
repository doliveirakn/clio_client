module ClioClient

  class CustomFieldValue < Resource

    set_attributes(id:                      {type: :int, readonly: true},
                   type:                    {type: :string},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   value:                   {type: :variable}
                   )
    
    has_association(:custom_field, ClioClient::CustomField)
    
  end
end

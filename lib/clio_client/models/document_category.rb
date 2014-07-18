module ClioClient

  class DocumentCategory < Resource
    
    set_attributes(id:                {type: :int, readonly: true},
                   account_id:        {type: :int, readonly: true},
                   created_at:        {type: :datetime, readonly: true},
                   updated_at:        {type: :datetime, readonly: true},
                   name:              {type: :string, readonly: true}
                   )

  end

end

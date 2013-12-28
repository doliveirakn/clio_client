module ClioClient
  class CustomFieldPicklistOption < Resource

    set_attributes(id:                   {type: :int,      readonly: true},
                   deleted_at:           {type: :datetime, readonly: true},
                   created_at:           {type: :datetime, readonly: true},
                   updated_at:           {type: :datetime, readonly: true},
                   name:                 {type: :string                  },
                   )


  end
end

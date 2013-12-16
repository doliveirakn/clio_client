module ClioClient

  class CustomFieldValue < Resource

    set_attributes(id:                      {type: :int, readonly: true},
                   type:                    {type: :string},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   )

  end
end

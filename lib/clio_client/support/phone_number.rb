module ClioClient
  class PhoneNumber < Resource

    set_attributes(id:                      {type: :int, readonly: true},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   name:                    {type: :string},
                   number:                  {type: :string},
                   default_number:          {type: :boolean},
                   )

  end
end

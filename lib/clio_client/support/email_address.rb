module ClioClient
  class EmailAddress < Resource

    set_attributes(id:                      {type: :int, readonly: true},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   name:                    {type: :string},
                   address:                 {type: :string}
                   )

  end
end

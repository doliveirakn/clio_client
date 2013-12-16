module ClioClient
  class Address < Resource

    set_attributes(id:                      {type: :int, readonly: true},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   name:                    {type: :string},
                   street:                  {type: :string},
                   city:                    {type: :string},
                   province:                {type: :string},
                   postal_code:             {type: :string},
                   country:                 {type: :string}
                   )

  end
end

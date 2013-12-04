module ClioClient
  class Contact < Resource

    set_attributes(id:                   {type: :int,      readonly: true},
                   type:                 {type: :string,   readonly: true},
                   created_at:           {type: :datetime, readonly: true},
                   updated_at:           {type: :datetime, readonly: true},
                   phone_numbers:        {type: :array                   },
                   email_addresses:      {type: :array                   },
                   addresses:            {type: :array                   },
                   web_sites:            {type: :array                   },
                   instant_messages:     {type: :array                   },
                   name:                 {type: :string                  },
                   prefix:               {type: :string                  },
                   first_name:           {type: :string                  },
                   last_name:            {type: :string                  }, 
                   title:                {type: :string                  },
                   custom_field_values:  {type: :array                   },
                   activity_rates:       {type: :array                   }
                   )

  end
end

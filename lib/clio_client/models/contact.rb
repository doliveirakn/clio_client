module ClioClient
  class Contact < Resource

    set_attributes(id:                   {type: :int,      readonly: true},
                   type:                 {type: :string,   readonly: true},
                   created_at:           {type: :datetime, readonly: true},
                   updated_at:           {type: :datetime, readonly: true},
                   name:                 {type: :string                  },
                   prefix:               {type: :string                  },
                   first_name:           {type: :string                  },
                   last_name:            {type: :string                  }, 
                   title:                {type: :string                  }
                   )

    has_many_association :phone_numbers,       ClioClient::PhoneNumber
    has_many_association :email_addresses,     ClioClient::EmailAddress
    has_many_association :addresses,           ClioClient::Address
    has_many_association :web_sites,           ClioClient::WebSite
    has_many_association :instant_messengers,  ClioClient::InstantMessenger
    has_many_association(:custom_field_values, ClioClient::CustomFieldValue, 
        :polymorphic => true, 
        :accepted_types => %w(CustomFieldCheckboxValue CustomFieldContactValue 
        CustomFieldCurrencyValue CustomFieldDateValue CustomFieldTimeValue 
        CustomFieldEmailValue CustomFieldMatterValue CustomFieldNumericValue 
        CustomFieldPicklistValue CustomFieldTextAreaValue 
        CustomFieldTextLineValue CustomFieldUrlValue))
    has_many_association :activity_rates,      ClioClient::Rate


    private
    def api
      session.contacts
    end
      


  end
end

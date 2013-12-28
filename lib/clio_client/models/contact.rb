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
    has_many_association :custom_field_values, ClioClient::CustomFieldValue
    has_many_association :activity_rates,      ClioClient::Rate

    def custom_field_values=(array)
      accepted_types = %w(CustomFieldCheckboxValue CustomFieldContactValue 
        CustomFieldCurrencyValue CustomFieldDateValue CustomFieldTimeValue 
        CustomFieldEmailValue CustomFieldMatterValue CustomFieldNumericValue 
        CustomFieldPicklistValue CustomFieldTextAreaValue 
        CustomFieldTextLineValue CustomFieldUrlValue)
      many = array.collect do |attributes|
        if accepted_types.include? attributes["type"]
          klass = ClioClient.const_get attributes["type"].intern
          klass.new(attributes, session)
        end
      end
      write_attribute("custom_field_values", many)
    end

  end
end

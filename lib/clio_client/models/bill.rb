module ClioClient
  class Bill < Resource
    
    set_attributes(
                   id:                  {type: :int,      readonly: true},
                   type:                {type: :string,   readonly: true},
                   original_bill_id:    {type: :int,      readonly: true},
                   created_at:          {type: :datetime, readonly: true},
                   updated_at:          {type: :datetime, readonly: true},
                   pdf_url:             {type: :string,   readonly: true},
                   number:              {type: :string                  },
                   subject:             {type: :string                  },
                   currency:            {type: :string                  },
                   purchase_order:      {type: :string                  },
                   memo:                {type: :string                  },
                   start_at:            {type: :datetime                },
                   end_at:              {type: :datetime                },
                   issued_at:           {type: :datetime                },
                   due_at:              {type: :datetime                },
                   tax_rate:            {type: :decimal                 },
                   secondary_tax_rate:  {type: :decimal                 },
                   discount:            {type: :decimal                 },
                   discount_type:       {type: :string                  },
                   discount_note:       {type: :note                    },
                   balance:             {type: :decimal                 },
                   status:              {type: :string, readonly: true  },
                   )

    has_association      :client,            ClioClient::Contact
    has_many_assocation  :matters,           ClioClient::Matter

  end
end

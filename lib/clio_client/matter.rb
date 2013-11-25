module ClioClient

  class Matter < Record
    
    attributes(id:                    {type: :int, readonly: true},
               created_at:            {type: :datetime, readonly: true},
               updated_at:            {type: :datetime, readonly: true},
               display_number:        {type: :string }
               client:                {type: :hash, required: true}
               status:                {type: :string, required: true},
               description:           {type: :string, required: true},
               client_reference:      {type: :string},
               responsible_attorney:  {type: :hash},
               location:              {type: :string},
               pending_date:          {type: :date},
               open_date:             {type: :date},
               close_date:            {type: :date},
               billable:              {type: :boolean},
               maildrop_address:      {type: :int, readonly: true},
               )


  end

end

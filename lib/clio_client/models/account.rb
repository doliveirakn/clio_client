module ClioClient

  class Account < Resource
    
    set_attributes(id:                {type: :int, readonly: true},
                   created_at:        {type: :datetime, readonly: true},
                   updated_at:        {type: :datetime, readonly: true},
                   maildrop_address:  {type: :string},
                   name:              {type: :string, readonly: true}
                   )
    
    has_association :owner, ClioClient::User

    private
    def api
      session.contacts
    end

  end

end

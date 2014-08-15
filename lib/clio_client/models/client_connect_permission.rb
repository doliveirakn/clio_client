module ClioClient
  class ClientConnectPermission < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   user_id:       {type: :int, readonly: true},
                   matter_id:     {type: :int},
                   contact_id:    {type: :int},
                   resource_type: {type: :string},
                   resource_id:   {type: :int}
                   )

    has_association :contact, ClioClient::Contact
    has_association :user,    ClioClient::User

    private

    def api
      session.client_connect_permissions
    end
      
  end
end

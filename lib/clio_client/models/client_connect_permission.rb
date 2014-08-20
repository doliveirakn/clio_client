module ClioClient
  class ClientConnectPermission < Resource

    set_attributes(id:                     {type: :int, readonly: true},
                   created_at:             {type: :datetime, readonly: true},
                   updated_at:             {type: :datetime, readonly: true},
                   client_connect_user_id: {type: :int, readonly: true},
                   resource_type:          {type: :string},
                   )

    has_association :contact, ClioClient::Contact
    has_association :user,    ClioClient::User
    has_association :matter,  ClioClient::Matter
    has_association(:resource, ClioClient::Resource,
      :polymorphic => true,
      :accepted_types => %w(Bill Document Task Matter CalendarEntry))

    private

    def api
      session.client_connect_permissions
    end
      
  end
end

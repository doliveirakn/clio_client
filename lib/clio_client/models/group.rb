module ClioClient
  class Group < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   name:          {type: :string},
                   )

    has_many_association :users, ClioClient::User

    private
    def api
      session.groups
    end
      
  end
end

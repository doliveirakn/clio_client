module ClioClient
  class Relationship < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   description:   {type: :string},
                   )

    has_association :contact, ClioClient::Contact
    has_association :matter, ClioClient::Matter

    private
    def api
      session.relationships
    end
      
  end
end

module ClioClient
  class CustomFieldSet < Resource

    set_attributes(id:          {type: :int, readonly: true},
                   created_at:  {type: :datetime, readonly: true},
                   updated_at:  {type: :datetime, readonly: true},
                   name:        {type: :string},
                   parent_type: {type: :string},
                   displayed:   {type: :boolean},
                   )

    has_many_association :members, ClioClient::CustomField


    private
    def api
      session.custom_field_sets
    end
      
  end
end

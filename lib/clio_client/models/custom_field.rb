module ClioClient
  class CustomField < Resource

    set_attributes(id:          {type: :int, readonly: true},
                   created_at:  {type: :datetime, readonly: true},
                   updated_at:  {type: :datetime, readonly: true},
                   name:        {type: :string},
                   parent_type: {type: :string},
                   field_type:  {type: :string},
                   displayed:   {type: :boolean},
                   custom_field_picklist_options:     {type: :array},
                   )

    private
    def api
      session.custom_fields
    end
      
  end
end

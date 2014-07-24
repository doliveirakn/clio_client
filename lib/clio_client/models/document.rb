module ClioClient
  class Document < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   description:   {type: :string, readonly: true},
                   category:      {type: :string, readonly: true},
                   content_type:  {type: :string, readonly: true},
                   filename:      {type: :string, readonly: true},
                   number:        {type: :int, readonly: true},
                   size:          {type: :int, readonly: true},
                   last_modified: {type: :datetime},
                   )

    has_association :matter, ClioClient::Matter
    has_association :user,   ClioClient::User
    has_association :document_category,   ClioClient::DocumentCategory
    has_many_association :document_versions, ClioClient::DocumentVersion

    def document_versions=(arr)
      many = arr.collect do |attributes|
        merged_attrs = attributes.merge("document_id" => id)
        ClioClient::DocumentVersion.new(merged_attrs, session)
      end
      write_attribute("document_versions", many)
    end
    
    private
    def api
      session.documents
    end
      
  end
end

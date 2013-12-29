module ClioClient
  class DocumentVersion < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   document_id:   {type: :int, readonly: true},
                   version:       {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   size:          {type: :int, readonly: true},
                   content_type:  {type: :string, readonly: true},
                   source_url:    {type: :string, readonly: true},
                   last_modified: {type: :datetime},
                   filename:      {type: :string}
                   )

    def download
      api.download(id)
    end


    private
    def api
      session.document_versions(document_id)
    end
      
  end
end

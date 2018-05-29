module ClioClient
  class DocumentUpload < Resource

    set_attributes(uuid:          {type: :string, readonly: true},
                   put_url:       {type: :string, readonly: true},
                   put_headers:   {type: :array, readonly: true},
                   fully_uploaded:{type: :array, readonly: false}
                   )

    

    def upload(doc_id, file)
      header_params = {}
      self.put_headers.each do |line|
        header_params[line["name"]] = line["value"] 
      end
      
      session.put_file_upload(self.put_url, file, header_params)
      self.fully_uploaded = true
      
      api.update(doc_id, {uuid: self.uuid, fully_uploaded: fully_uploaded})

    end
    
    private
    def api
      session.documents
    end

  end
end

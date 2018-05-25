module ClioClient
  class DocumentUpload < Resource

    set_attributes(uuid:          {type: :string, readonly: true},
                   put_url:       {type: :string, readonly: true},
                   put_headers:   {type: :array, readonly: true}
                   )


  end
end

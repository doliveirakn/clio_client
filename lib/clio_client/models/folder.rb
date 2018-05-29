module ClioClient
  class Folder < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   deleted_at:    {type: :datetime, readonly: true},
                   type:          {type: :string, readonly: true},
                   locked:        {type: :boolean, readonly: true},
                   name:          {type: :string, readonly: false},
                   root:          {type: :boolean, readonly: true}
                   )

    has_association :parent, ClioClient::Folder
    has_association :matter, ClioClient::Matter
    has_association(:contact,            ClioClient::Contact, 
                    :polymorphic => true, :accepted_types => %w(Person Company))
    has_association :creator,   ClioClient::User
    has_association :document_category,   ClioClient::DocumentCategory
    has_many_association :latest_document_versions, ClioClient::DocumentUpload 
    
    def save(params = {})
      if self.id.nil?
        save_params = self.to_params.reject!{|k,v| k.to_s == "parent_id" }
        save_params[:parent] = self.parent.to_params
        saved_item = api.create(params.merge(save_params))
        self.id = saved_item && saved_item.id
        self
      else
        api.update(self.id, params.merge(self.to_params))
        self
      end
    end
    
    
    def latest_document_versions=(arr)
      many = arr.collect do |attributes|
        merged_attrs = attributes.merge("document_id" => id)
        ClioClient::DocumentVersion.new(merged_attrs, session)
      end
      write_attribute("latest_document_versions", many)
    end
    
    private
    def api
      session.folders
    end
      
  end
end

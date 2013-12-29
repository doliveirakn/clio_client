module ClioClient
  
  class Communication < Resource

    set_attributes(id:          {type: :int, readonly: true},
                   type:        {type: :string, readonly: true},
                   created_at:  {type: :datetime, readonly: true},
                   updated_at:  {type: :datetime, readonly: true},
                   subject:     {type: :string},
                   body:        {type: :string},
                   date:        {type: :date},
                   )

    alias_method :name, :subject
    alias_method :name=, :subject=

    has_association :matter,         ClioClient::Matter
    has_many_association(:senders,   ClioClient::Resource, 
                         :polymorphic => true, 
                         :accepted_types => %w(Contact User))

    has_many_association(:receivers, ClioClient::Resource, 
                         :polymorphic => true, 
                         :accepted_types => %w(Contact User))
    
    private
    def api
      session.communications
    end
      

  end

end

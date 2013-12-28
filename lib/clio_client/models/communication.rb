module ClioClient
  
  class Communication < Resource

    set_attributes(id:          {type: :int, readonly: true},
                   type:        {type: :string, readonly: true},
                   created_at:  {type: :datetime, readonly: true},
                   updated_at:  {type: :datetime, readonly: true},
                   subject:     {type: :string},
                   body:        {type: :text},
                   date:        {type: :date},
                   senders:     {type: :array},
                   receivers:   {type: :array}                 
                   )

    alias_method :name, :subject
    alias_method :name=, :subject=

    has_association :matter, ClioClient::Matter
    
    private
    def api
      session.communications
    end
      

  end

end

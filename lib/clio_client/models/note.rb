module ClioClient
  
  class Note < Resource
    
    set_attributes(id:                      {type: :int, readonly: true},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   subject:                 {type: :string},
                   detail:                  {type: :string},
                   date:                    {type: :date}
                   )

    has_association(:regarding,            ClioClient::Resource, 
                    :polymorphic => true, :accepted_types => %w(Contact Matter))

    private
    def api
      session.notes
    end

  end

end

module ClioClient

  class Activity < Resource

    set_attributes(id:           {type: :int,      readonly: true},
                   created_at:   {type: :datetime, readonly: true}, 
                   updated_at:   {type: :datetime, readonly: true}, 
                   type:         {type: :string,   required: true}, 
                   date:         {type: :date                    },
                   quantity:     {type: :decimal,  required: true},
                   price:        {type: :decimal,  required: true},
                   total:        {type: :string,   readonly: true}, 
                   note:         {type: :string                  },
                   billed:       {type: :boolean,  readonly: true}
                   )

    

    has_association :user,                 ClioClient::User
    has_association :matter,               ClioClient::Matter
    has_association :activity_description, ClioClient::ActivityDescription
    has_association :communication,        ClioClient::Communication

    private
    def api
      session.activities
    end
    
  end

end

module ClioClient
  class TimelineEvent < Resource

    set_attributes(id:            {type: :int, readonly: true},
                   created_at:    {type: :datetime, readonly: true},
                   updated_at:    {type: :datetime, readonly: true},
                   event_type:    {type: :string},
                   old_subject_name:   {type: :string},
                   subject:       {type: :hash}
                   )

    has_association(:actor, ClioClient::Resource, 
                    :polymorphic => true, 
                    :accepted_types => %w(Contact User))

    has_association :matter, ClioClient::Matter
    

    private
    def api
      session.timeline_events
    end
      
  end
end

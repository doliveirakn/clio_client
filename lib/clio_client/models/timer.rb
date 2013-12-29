module ClioClient

  class Timer < Resource
    
    set_attributes(id:                {type: :int, readonly: true},
                   created_at:        {type: :datetime, readonly: true},
                   updated_at:        {type: :datetime, readonly: true},
                   start_time:        {type: :datetime},
                   )

    has_association :activity, ClioClient::TimeEntry

    def start
      api.start({activity_id: self.to_params[(:activity_id)]})
    end

    def stop
      api.stop
    end

    private
    def api
      session.timer
    end

  end

end

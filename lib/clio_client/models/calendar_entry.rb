module ClioClient
  class CalendarEntry < Resource
    
    set_attributes(
                   id:                       {type: :int,      readonly: true},
                   created_at:               {type: :datetime, readonly: true},
                   updated_at:               {type: :datetime, readonly: true},
                   start_date_time:          {type: :datetime                },
                   end_date_time:            {type: :datetime                },
                   start_date:               {type: :date,     readonly: true},
                   end_date:                 {type: :date                    },
                   summary:                  {type: :string                  },
                   description:              {type: :string                  },
                   location:                 {type: :string                  },
                   permission:               {type: :string,   readonly: true},
                   recurrence_rule:          {type: :string                  },
                   parent_calendar_entry_id: {type: :int                     },
                   original_event_start_at:  {type: :datetime                },
                   reminders:                {type: :array, of: :reminder    },
                   )

    has_association      :matter,              ClioClient::Matter
    has_association      :calendar,            ClioClient::Calendar
    has_many_association :attending_calendars, ClioClient::Calendar

    private
    def api
      session.calendar_entries
    end

  end
end

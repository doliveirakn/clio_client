module ClioClient

  class Session

    include Http
    include Authorization

    attr_accessor :access_token
    attr_accessor :end_points

    def initialize(credentials = {})
      self.access_token = credentials[:access_token]
      self.end_points = {}
    end

    { activities:            ClioClient::Api::Activity,
      activity_descriptions: ClioClient::Api::ActivityDescription,
      bills:                 ClioClient::Api::Bill,
      calendar_entries:      ClioClient::Api::CalendarEntry,
      calendars:             ClioClient::Api::Calendar,
      communications:        ClioClient::Api::Communication,
      contacts:              ClioClient::Api::Contact,
      custom_field_sets:     ClioClient::Api::CustomFieldSet,
      custom_fields:         ClioClient::Api::CustomField,
    }.each_pair do |method, klass| 
      define_method method do
        end_points[method] ||= klass.new(self)
      end
    end    

  end

end

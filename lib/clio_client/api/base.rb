module ClioClient
  module Api
    class Base

      include Http
      include Authorization

      attr_accessor :access_token

      attr_writer :time_entries, :expense_entries

      def initialize(credentials = {})
        self.access_token = credentials[:access_token]
      end

      def time_entries
        @activities ||= ClioClient::Api::TimeEntry.new(self)
      end

      def expense_entries
        @activities ||= ClioClient::Api::ExpenseEntry.new(self)
      end

    end
  end
end

require 'spec_helper'

describe ClioClient::CalendarEntry do

  context "when initialized with the example attributes" do
    let(:params) do
      {
        "id" => "5",
        "recurrence_rule" => nil,
        "parent_calendar_entry_id" => nil,
        "created_at" => "2013-12-03T23:35:34+00:00",
        "updated_at" => "2013-12-03T23:35:34+00:00",
        "calendar" => {
          "id" => "1",
          "url" => "/api/v2/calendars/1",
          "name" => "Firm"
        },
        "attending_calendars" => [

                               ],
        "start_date" => "2014-03-05",
        "end_date" => "2014-03-06",
        "original_event_start_date" => nil,
        "permission" => "owner",
        "summary" => "Tenetur adipisci dolorem unde suscipit at qui nam.",
        "description" => "Aut laborum nihil. Necessitatibus quae voluptatem quia velit et. Illo asperiores et. Nostrum deserunt veritatis qui hic ut.",
        "location" => nil,
        "matter" => nil,
        "reminders" => [

                     ]
      }
    end
    include_examples "model initialization"

  end


  context "matter association" do
    let(:attribute) { :matter }
    let(:klass) { ClioClient::Matter }    
    include_examples "association"
  end
  context "matter association" do
    let(:attribute) { :calendar }
    let(:klass) { ClioClient::Calendar }    
    include_examples "association"
  end
  context "matter association" do
    let(:attribute) { :attending_calendars }
    let(:klass) { ClioClient::Calendar }    
    include_examples "has many association"
  end
  context "matter association" do
    let(:attribute) { :reminders }
    let(:klass) { ClioClient::Reminder }
    let(:association_params) { {"id" => nil, "name" => nil, "minutes" => 1, "method" => "popup" }}
    include_examples "has many association"
  end


end

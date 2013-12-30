require 'spec_helper'

describe ClioClient::CalendarEntry do

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

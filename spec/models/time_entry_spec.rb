require 'spec_helper'

describe ClioClient::TimeEntry do

  context "can be initialized with the example attributes" do
    let(:params) do
      {
        "id" => "20",
        "type" => "TimeEntry",
        "user" => {
          "id" => "1",
          "url" => "/api/v2/users/1",
          "name" => "Demo User"
        },
        "matter" => {
          "id" => "8",
          "url" => "/api/v2/matters/8",
          "name" => "00008-Koch, Prosacco and Stroman"
        },
        "activity_description" => {
          "id" => "4",
          "url" => "/api/v2/activity_descriptions/4",
          "name" => "Discovery"
        },
        "communication" => nil,
        "date" => "2013-01-26",
        "note" => "Ea sunt quo dolorum dolore corporis ipsam culpa quis.",
        "price" => "100.0",
        "quantity" => "19944.0",
        "total" => "554.0",
        "billed" => "false",
        "created_at" => "2013-12-03T23:35:37+00:00",
        "updated_at" => "2013-12-03T23:35:37+00:00"
      }
    end

    include_examples "model initialization"

  end

end

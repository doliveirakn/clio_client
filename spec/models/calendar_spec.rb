require 'spec_helper'

describe ClioClient::Calendar do
  context "when initialized with the example attributes" do
    let(:params) do
      {
        "id" => "1",
        "name" => "Firm",
        "type" => "AccountCalendar",
        "created_at" => "2013-12-03T23:35:26+00:00",
        "updated_at" => "2013-12-03T23:35:36+00:00",
        "permission" => "owner",
        "color" => "#da6666"
      }
    end

    include_examples "model initialization"

  end
end

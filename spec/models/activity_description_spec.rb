require 'spec_helper'

describe ClioClient::ActivityDescription do

  context "when initialized with the example attributes" do
    let(:params) do
      {
        "id" => "1",
        "name" => "Phone Call",
        "created_at" => "2013-12-03T23:35:36+00:00",
        "updated_at" => "2013-12-03T23:35:36+00:00",
        "activity_rate_default" => nil,
        "rates" => [
                  {
                    "user_id" => "1",
                    "rate" => "700.0",
                    "source" => "user",
                    "flat_rate" => "false"
                  },
                  {
                    "user_id" => "2",
                    "rate" => "650.0",
                    "source" => "user",
                    "flat_rate" => "false"
                  },
                  {
                    "user_id" => "3",
                    "rate" => "600.0",
                    "source" => "user",
                    "flat_rate" => "false"
                  }
                 ]
      }
      
    end
    include_examples "model initialization"
    
  end

  context "rates association" do
    let(:association_params) { {"name" => nil, "rate" => 1.0, "source" => "a" }}
    let(:attribute) { :rates }
    let(:klass) { ClioClient::Rate }    
    include_examples "has many association"
  end

end

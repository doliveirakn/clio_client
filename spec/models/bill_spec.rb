require 'spec_helper'

describe ClioClient::Bill do

  context "when initialized with the example attributes" do
    let(:params) do
    {
      "id" => "1",
      "pdf_url" => "/api/v2/bills/1.pdf",
      "number" => "1148",
      "subject" => nil,
      "currency" => "USD",
      "purchase_order" => nil,
      "memo" => nil,
      "start_at" => nil,
      "end_at" => nil,
      "issued_at" => "2013-07-27",
      "due_at" => "2013-08-26",
      "type" => "Bill",
      "original_bill_id" => nil,
      "tax_rate" => "0.0",
      "secondary_tax_rate" => "0.0",
      "discount" => "0.0",
      "discount_type" => nil,
      "discount_note" => nil,
      "balance" => "1075.0",
      "total" => "1075.0",
      "status" => "Past Due",
      "matters" => [
        {
          "id" => "5",
          "url" => "/api/v2/matters/5",
          "name" => "00005-Marvin, Rohan and Block"
        }
      ],
      "client" => {
        "id" => "1",
        "url" => "/api/v2/contacts/1",
        "name" => "Pacocha-Bode"
      },
      "created_at" => "2013-12-03T23:35:39+00:00",
      "updated_at" => "2013-12-03T23:35:41+00:00"
    }

    end
    include_examples "model initialization"
    
  end

  context "client association" do
    let(:attribute) { :client }
    let(:klass) { ClioClient::Contact }    
    include_examples "association"
  end


  context "matters association" do
    let(:attribute) { :matters }
    let(:klass) { ClioClient::Matter }
    include_examples "has many association"
  end

end

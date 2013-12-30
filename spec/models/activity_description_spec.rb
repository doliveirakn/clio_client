require 'spec_helper'

describe ClioClient::ActivityDescription do

  context "rates association" do
    let(:association_params) { {"name" => nil, "rate" => 1.0, "source" => "a" }}
    let(:attribute) { :rates }
    let(:klass) { ClioClient::Rate }    
    include_examples "has many association"
  end

end

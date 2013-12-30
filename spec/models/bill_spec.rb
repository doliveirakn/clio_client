require 'spec_helper'

describe ClioClient::Bill do

  context "client association with a person" do
    let(:attribute) { :client }
    let(:klass) { ClioClient::Person }    
    let(:association_params) { {"type" => "Person" }}
    include_examples "association"
  end

  context "client association with a company" do
    let(:attribute) { :client }
    let(:klass) { ClioClient::Company }
    let(:association_params) { {"type" => "Company" }}
    include_examples "association"
  end

  context "matters association" do
    let(:attribute) { :matters }
    let(:klass) { ClioClient::Matter }
    include_examples "has many association"
  end

end

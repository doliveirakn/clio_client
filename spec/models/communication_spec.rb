require 'spec_helper'

describe ClioClient::Communication do

  context "matter association" do
    let(:attribute) { :matter }
    let(:klass) { ClioClient::Matter }    
    include_examples "association"
  end

  context "senders association with a contact" do
    let(:attribute) { :senders }
    let(:klass) { ClioClient::Contact }    
    let(:association_params) { {"type" => "Contact" }}
    include_examples "has many association"
  end

  context "senders association with a user" do
    let(:attribute) { :senders }
    let(:klass) { ClioClient::User }
    let(:association_params) { {"type" => "User" }}
    include_examples "has many association"
  end

  context "receivers association with a contact" do
    let(:attribute) { :receivers }
    let(:klass) { ClioClient::Contact }    
    let(:association_params) { {"type" => "Contact" }}
    include_examples "has many association"
  end

  context "receivers association with a user" do
    let(:attribute) { :receivers }
    let(:klass) { ClioClient::User }
    let(:association_params) { {"type" => "User" }}
    include_examples "has many association"
  end

end

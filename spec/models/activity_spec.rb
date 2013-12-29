require 'spec_helper'

describe ClioClient::Activity do

  let(:session) { double("ClioClient::Session") }

  subject { ClioClient::Activity.new(params, session) }

  context "user association" do
    let(:attribute) { :user }
    let(:klass) { ClioClient::User }    
    include_examples "association"
  end

  context "matter association" do
    let(:attribute) { :matter }
    let(:klass) { ClioClient::Matter }    
    include_examples "association"
  end

  context "activity description association" do
    let(:attribute) { :activity_description }
    let(:klass) { ClioClient::ActivityDescription }
    include_examples "association"
  end

  context "communication association" do
    let(:attribute) { :communication }
    let(:klass) { ClioClient::Communication }
    include_examples "association"
  end

end

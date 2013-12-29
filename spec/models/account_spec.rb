require 'spec_helper'

describe ClioClient::Account do

  let(:session) { double("ClioClient::Session") }

  subject { ClioClient::Account.new(params, session) }

  context "owner association" do
    let(:attribute) { :owner }
    let(:klass) { ClioClient::User }    
    include_examples "association"
  end


end

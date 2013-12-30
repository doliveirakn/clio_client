require 'spec_helper'

describe ClioClient::Account do

  context "owner association" do
    let(:attribute) { :owner }
    let(:klass) { ClioClient::User }    
    include_examples "association"
  end


end

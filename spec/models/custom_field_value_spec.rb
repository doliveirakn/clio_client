require 'spec_helper'

describe ClioClient::CustomFieldValue do

  context "custom_field association" do
    let(:attribute) { :custom_field }
    let(:klass) { ClioClient::CustomField }    
    include_examples "association"
  end

end

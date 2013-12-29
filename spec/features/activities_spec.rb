require 'spec_helper'

describe ClioClient::Api::Activity, :external => true do

  let(:session) { ClioClient::Session.new(:access_token => ENV['ACCESS_TOKEN']) }
  let(:api) { session.activities }
  
  let(:params) do
    {
      type: "TimeEntry",
      quantity: 3600,
      price: 10.0,
      date: '2013-01-01'
    }
  end

  let(:changed_field) { :note }
  let(:changed_value) { "Magic Value" }

  it "is crudable" do
    item = api.create(params)    
    stored_item = api.find(item.id)
    expect(item).to eql stored_item

    item = api.update(item.id, {changed_field => changed_value})
    expect(item[changed_field]).to eql changed_value

    api.destroy(item.id)
    
    expect(api.find(item.id)).to be_nil
  end

  

end

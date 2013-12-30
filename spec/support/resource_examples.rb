shared_examples "association" do
  
  let(:nested_params) do
    {"id" => 1, "name" => "name" }.merge(association_params)
  end
  let(:params) do
    { attribute => nested_params }
  end

  it "should convert attributes to a clio object" do
    obj = model[attribute]
    expect(obj).to be_kind_of klass
    nested_params.each_pair do |k, v|
      expect(obj[k]).to eql v if v && k != "type"
    end
  end

  describe "#to_params" do
    it "should include the association" do
      p = model.to_params
      expect(p["#{attribute}_id".intern]).to eql 1
    end
  end

end

shared_examples "has many association" do
  let(:nested_params) do
    {"id" => 1, "name" => "name" }.merge(association_params)
  end
  let(:params) do
    { attribute => [nested_params] }
  end

  it "should convert attributes to a clio object" do
    obj = model[attribute].first
    expect(obj).to be_kind_of klass
    nested_params.each_pair do |k, v|
      expect(obj[k]).to eql v if v && k != "type"
    end
  end

  describe "#to_params" do
    it "should include the associations" do
      obj = model[attribute].first
      p = obj.to_params
      expect(model.to_params[attribute]).to eql [p]
    end
  end

end

shared_examples "model initialization" do

  it "should record all of the attributes and values" do
    params.each_pair do |key, actual_value|
      expected_value = model[key]
      if expected_value.kind_of? ClioClient::Resource
        actual_value.each_pair do |nested_key, nested_value|
          next if nested_key == "url"
          expect(expected_value[nested_key].to_s).to eql(nested_value)
        end
      else
        expect(expected_value.to_s).to eql(actual_value.to_s)
      end
    end
  end

end


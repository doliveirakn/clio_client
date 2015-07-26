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

  def check_attributes(model, attributes)
    attributes.each_pair do |key, actual_value|
      next if key == "url"
      expected_value = model[key]
      if expected_value.kind_of? ClioClient::Resource
        check_attributes(expected_value, actual_value)
      elsif expected_value.kind_of? Array
        expected_value.zip(actual_value).each do |m, attr|
          check_attributes(m, attr)
        end
      else
        expect(expected_value.to_s).to eql(actual_value.to_s), custom_failure_message(key, expected_value, actual_value)
      end
    end
  end

  def custom_failure_message(key, e, a)
    ["", "    key: #{key.inspect}",
     "expected: #{e.to_s.inspect}",
     "     got: #{a.to_s.inspect}", ""].join("\n")
  end

  it "should record all of the attributes and values" do
    check_attributes(model, params)
  end

end

shared_examples "typed resource" do

  it "should accept type key as a string" do
    verify_type_key( { "type" => type_value } )
  end

  it "should accept type key as a symbol" do
    verify_type_key( { type: type_value } )

  end

  def verify_type_key(attributes)
    record = subject.new(attributes)
    expect(record).to be_kind_of type_klass
    expect(record.type).to eql type_value
  end

end


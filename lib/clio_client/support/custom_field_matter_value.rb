module ClioClient
  class CustomFieldMatterValue < CustomFieldValue

    self.attributes[:value] = {type: :int}

    has_association :matter, ClioClient::Matter
    
  end
end

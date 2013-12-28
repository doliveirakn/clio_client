module ClioClient
  class CustomFieldEmailValue < CustomFieldValue

    self.attributes[:value] = {type: :string}
    
  end
end

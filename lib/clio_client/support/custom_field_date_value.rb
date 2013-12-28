module ClioClient
  class CustomFieldDateValue < CustomFieldValue

    self.attributes[:value] = {type: :date}
    
  end
end

module ClioClient
  class CustomFieldTimeValue < CustomFieldValue

    self.attributes[:value] = {type: :time}
    
  end
end

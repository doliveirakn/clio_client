module ClioClient
  class CustomFieldCurrencyValue < CustomFieldValue

    self.attributes[:value] = {type: :decimal}
    
  end
end

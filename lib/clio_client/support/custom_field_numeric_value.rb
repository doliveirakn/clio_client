module ClioClient
  class CustomFieldNumericValue < CustomFieldValue

    self.attributes[:value] = {type: :decimal}

  end
end

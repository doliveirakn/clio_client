module ClioClient
  class CustomFieldTextLineValue < CustomFieldValue

    self.attributes[:value] = {type: :string}

  end
end

module ClioClient

  class Matter < Record
    
    attr_accessor(:id, :display_number, :description, :status, :open_date, 
                  :close_date, :pending_date, :location, :client_reference, 
                  :responsible_attorney, :practice_area, :billable, 
                  :maildrop_address, :created_at, :updated_at, :custom_field_values, 
                  :billing_method, :permission, :activity_rates)


  end

end

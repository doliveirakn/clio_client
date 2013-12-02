module ClioClient
  
  class ActivityDescription < Record
    
    attr_accessor(:id, :name, :created_at, :updated_at, :activity_rate_default, :rates)

  end

end

module ClioClient

  class User < Record
    
    attr_accessor(:id, :created_at, :updated_at, :subscription_plan, 
                  :time_zone, :iana_time_zone, :first_name, :last_name, 
                  :email, :enabled, :name,
                  :rate, :avatar_url, :authenticated)

  end

end

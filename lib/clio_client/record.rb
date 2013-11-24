module ClioClient
  class Record
    
    def self.has_association(name, klass)
      attr_reader name
      define_method "#{name}=" do |attributes|
        instance_variable_set("@#{name}", klass.new(attributes))
      end
      
    end

    def initialize(values = {})
      values.each_pair do |k, v|
        self.send("#{k}=", v) if respond_to?("#{k}=") && !v.nil?
      end
    end

  end
end

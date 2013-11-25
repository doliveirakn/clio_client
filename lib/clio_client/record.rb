module ClioClient

  class RecordNotSaved < Exception; end
  class AttributeReadOnly < Excpetion; end

  class Record

    attr_accessor :end_point

    def self.attributes(attrs)
      raise "Attributes already set" if @@attributes
      @@attributes = attrs
      attrs.each_pair do |name, options|
        attr_reader name
        if options[:readonly]
          defined_method "#{name}=" do |value|
            if send(name).nil?
              instance_variable_set("@#{name}", value)
            else
              raise AttributeReadOnly
            end
          end
        else
          attr_writer name
        end
      end
    end
    
    def self.has_association(name, klass)
      attr_reader name
      define_method "#{name}=" do |attributes|
        instance_variable_set("@#{name}", klass.new(attributes))
      end
      
    end

    def initialize(end_point, values = {})
      self.end_point = end_point
      values.each_pair do |k, v|
        self.send("#{k}=", v) if respond_to?("#{k}=") && !v.nil?
      end
    end

    def save
      if self.id.nil?
        end_point.create(self.to_params)
      else
        end_point.update(self.to_params)
      end
    end

    def reload
      raise RecordNotSaved if self.id.nil?
      end_point.get(self.id)
    end

    def destroy
      raise RecordNotSaved if self.id.nil?
      end_point.delete(self.id)
    end

  end
end

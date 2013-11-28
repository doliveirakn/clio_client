module ClioClient

  class RecordNotSaved < Exception; end
  class AttributeReadOnly < Exception; end
  class ApiUnavilableForNestedAttribute < Exception; end
  class Record

    attr_accessor :end_point

    class << self

      attr_accessor :attributes
      def set_attributes(attrs)
        self.attributes = attrs
        attrs.each_pair do |name, options|
          attr_reader name
          define_method "#{name}=" do |value|
            raise AttributeReadOnly if !send(name).nil? && options[:readonly]
            instance_variable_set("@#{name}", convert_attribute(value, options))
          end
        end
      end
      
      def inherited(subclass)
        if !self.attributes.nil?
          subclass.set_attributes(self.attributes)
        end
      end

    end
      
    def self.has_association(name, klass)
      attr_accessor "#{name}_id"
      attr_reader name
      define_method "#{name}=" do |attributes|
        instance_variable_set("@#{name}_id", attributes["id"])
        instance_variable_set("@#{name}", klass.new(nil, attributes))
      end      
    end

    def [](val)
      self.send(val)
    end

    def initialize(end_point, values = {})
      self.end_point = end_point
      values.each_pair do |k, v|
        self.send("#{k}=", v) if respond_to?("#{k}=") && !v.nil?
      end
    end

    def save
      raise ApiUnavilableForNestedAttribute if end_point.nil?
      if self.id.nil?
        end_point.create(self.to_params)
      else
        end_point.update(self.id, self.to_params)
      end
    end

    def reload
      raise ApiUnavilableForNestedAttribute if end_point.nil?
      raise RecordNotSaved if self.id.nil?
      end_point.find(self.id)
    end

    def destroy
      raise ApiUnavilableForNestedAttribute if end_point.nil?
      raise RecordNotSaved if self.id.nil?
      end_point.destroy(self.id)
    end

    def to_params
      self.class.attributes.inject({}) do |h, (attr, opts)|
        self[attr] ? h.merge(attr => self[attr].to_s) : h
      end
    end

    private
    def convert_attribute(val, options)
      case options[:type]
      when :int then val.to_i
      when :string then val.to_s
      when :date then Date.parse(val)
      when :decimal then val.to_f
      when :boolean then !!val
      when :datetime then DateTime.parse(val)
      end
    end

  end
end

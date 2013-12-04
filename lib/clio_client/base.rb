module ClioClient
  class Base

    class << self

      attr_accessor :attributes
      def set_attributes(attrs)
        self.attributes = attrs
        attrs.each_pair do |name, options|
          attr_reader name
          define_method "#{name}=" do |value|
            if options[:readonly] && !instance_variable_get("@#{name}").nil?
              raise AttributeReadOnly 
            end
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

    def [](val)
      self.send(val)
    end

    def initialize(values = {})
      values.each_pair do |k, v|
        self.send("#{k}=", v) if respond_to?("#{k}=") && !v.nil?
      end
    end

    def to_params
      self.class.attributes.inject({}) do |h, (attr, opts)|
        self[attr] ? h.merge(attr => paramify(self[attr])) : h
      end
    end
    
    private
    def paramify(val)
      if val.kind_of? ClioClient::Base
        val.to_params
      else
        val.to_s
      end
    end

    def convert_attribute(val, options)
      case options[:type]
      when :int then val.to_i
      when :string then val.to_s
      when :date then Date.parse(val)
      when :decimal then val.to_f
      when :boolean then !!val
      when :datetime then DateTime.parse(val)
      when :array then Array(val)
      else val
      end
    end

  end
end

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
        has_attribute?(attr) ? h.merge(attr => paramify(self[attr])) : h
      end
    end

    def self.inspect
      attr_list = attributes.inject([]) do |a, (attr, opts)|
        a << "#{attr}: #{opts[:type]}"
      end * ", "
      "#{super}(#{attr_list})"
    end
    
    def inspect
      attr_list = self.class.attributes.inject([]) do |a, (attr, opts)|
        if has_attribute?(attr)
          a << "#{attr}: #{self[attr]}"
        else
          a
        end
      end * ", "      
      "#<#{self.class} #{attr_list}>"
    end

    private
    def has_attribute?(attr)
      instance_variable_defined?("@#{attr}")
    end

    def paramify(val)
      if val.kind_of? ClioClient::Base
        val.to_params
      else
        val
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
      when :array then 
        Array(val).collect{|v| options[:of].try(:new, v) || v }
      when :rate then ClioClient::Rate.new(val)
      when :foreign_key 
        (val == "" || val.nil?) ? nil : val.to_i
      else val
      end
    end

  end
end

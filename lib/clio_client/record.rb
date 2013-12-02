module ClioClient

  class RecordNotSaved < Exception; end
  class AttributeReadOnly < Exception; end

  class Record

    attr_accessor :session

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

      def has_association(name, klass)
        attr_accessor "#{name}_id"
        attr_reader name
        define_method "#{name}=" do |attributes|
          instance_variable_set("@#{name}_id", attributes["id"])
          instance_variable_set("@#{name}", klass.new(nil, attributes))
        end      
      end
    end
      
    def ==(o)
      self.class == o.class && !self.id.nil? && self.id != "" && self.id == o.id
    end
    alias_method :eql?, :==

    def [](val)
      self.send(val)
    end

    def initialize(session, values = {})
      self.session = session
      values.each_pair do |k, v|
        self.send("#{k}=", v) if respond_to?("#{k}=") && !v.nil?
      end
    end

    def save
      if self.id.nil?
        api.create(self.to_params)
      else
        api.update(self.id, self.to_params)
      end
    end

    def reload
      raise RecordNotSaved if self.id.nil?
      api.find(self.id)
    end

    def destroy
      raise RecordNotSaved if self.id.nil?
      api.destroy(self.id)
    end

    def to_params
      self.class.attributes.inject({}) do |h, (attr, opts)|
        self[attr] ? h.merge(attr => self[attr].to_s) : h
      end
    end

    private
    def api
      raise NotImplementedError
    end

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

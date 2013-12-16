module ClioClient

  class ResourceNotSaved < Exception; end
  class AttributeReadOnly < Exception; end

  class Resource

    attr_accessor :session

    def self.inspect
      attr_list = attributes.inject([]) do |a, (attr, opts)|
        a << "#{attr}: #{opts[:type]}"
      end * ", "
      "#{super}(#{attr_list})"
    end
    
    def inspect
      attr_list = self.class.attributes.inject([]) do |a, (attr, opts)|
        if has_attribute?(attr)
          a << "#{attr}: #{self[attr].inspect}"
        else
          a
        end
      end * ", "      
      "#<#{self.class} #{attr_list}>"
    end

    def initialize(values = {}, session = nil)
      self.session = session
      values.each_pair do |k, v|
        self.send("#{k}=", v) if respond_to?("#{k}=") && !v.nil?
      end
    end

    def to_params
      self.class.attributes.inject({}) do |h, (attr, opts)|
        has_attribute?(attr) ? h.merge(attr => paramify(self[attr])) : h
      end
    end



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
        self.attributes["#{name}_id".intern] = {type: :foreign_key}
        define_method "#{name}=" do |attributes|
          instance_variable_set("@#{name}_id", attributes["id"])
          instance_variable_set("@#{name}", klass.new(attributes, session))
        end      
      end

      def has_many_association(name, klass)
        attr_reader name
        self.attributes[name.intern] = {type: :has_many_association}
        define_method "#{name}=" do |arr|
          many = arr.collect{|attributes| klass.new(attributes, session) } 
          instance_variable_set("@#{name}", many)
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

    def save
      if self.id.nil?
        saved_item = api.create(self.to_params)
        self.id = saved_item.id
        self
      else
        api.update(self.id, self.to_params)
        self
      end
    end

    def reload
      raise ResourceNotSaved if self.id.nil?
      api.find(self.id)
    end

    def destroy
      raise ResourceNotSaved if self.id.nil?
      api.destroy(self.id)
    end

    private
    def api
      raise NotImplementedError
    end

    def has_attribute?(attr)
      instance_variable_defined?("@#{attr}")
    end

    def paramify(val)      
      if val.kind_of? ClioClient::Base
        val.to_params
      elsif val.kind_of? Array
        val.collect{|v| paramify(v) }
      else
        val
      end
    end

    def convert_attribute(val, options)
      case options[:type]
      when :int
        val.to_i
      when :string
        val.to_s
      when :date
        val.kind_of?(Date) ? val : Date.parse(val)
      when :decimal
        val.to_f
      when :boolean 
        !!val
      when :datetime 
        val.kind_of?(DateTime) ? val : DateTime.parse(val)
      when :foreign_key 
        (val == "" || val.nil?) ? nil : val.to_i
      else 
        val
      end
    end

  end
end

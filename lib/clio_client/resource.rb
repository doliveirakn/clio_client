module ClioClient

  class ResourceNotSaved < Exception; end
  class AttributeReadOnly < Exception; end

  class Resource < Base

    attr_accessor :session

    class << self

      def has_association(name, klass)
        attr_accessor "#{name}_id"
        attr_reader name
        self.attributes["#{name}_id".intern] = {type: :int}
        define_method "#{name}=" do |attributes|
          instance_variable_set("@#{name}_id", attributes["id"])
          instance_variable_set("@#{name}", klass.new(session, attributes))
        end      
      end

      def has_many_association(name, klass)
        attr_reader name
        define_method "#{name}=" do |arr|
          many = arr.collect{|attributes| klass.new(session, attributes) } 
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

    def initialize(session, values = {})
      self.session = session
      super(values)
    end

    def save
      if self.id.nil?
        api.create(self.to_params)
      else
        api.update(self.id, self.to_params)
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

  end
end

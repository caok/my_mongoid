module MyMongoid
  module Document

    def self.included(base)
      base.extend ClassMethods

      MyMongoid.register_model base
    end

    module ClassMethods
      def is_mongoid_model?
        true
      end
    end

    def initialize attrs = {}
      raise ArgumentError, "Only accept hash as argument" unless attrs.is_a? Hash
      @attributes = attrs
    end

    def attributes
      @attributes ||= {}
    end

    def read_attribute(name)
      @attributes[name]
    end

    def write_attribute(name, value)
      @attributes[name] = value
    end

    def new_record?
      true
    end
  end
end

module MyMongoid
  module Document

    def self.included(base)
      base.extend ClassMethods
      base.field :_id
      base.alias_field :id, :_id

      MyMongoid.register_model base
    end

    module ClassMethods
      def is_mongoid_model?
        true
      end

      def field(field_name)
        raise DuplicateFieldError if fields.key?(field_name.to_s)

        define_method(field_name.to_s) do
           self.read_attribute field_name.to_s
        end

        define_method("#{field_name}=") do |value|
          self.write_attribute field_name.to_s, value
        end

        fields[field_name.to_s] = MyMongoid::Field.new(field_name.to_s)
      end

      def fields
        @fields ||= {}
      end

      def alias_field(as, field)
        alias_method(as, field)
        alias_method("#{as}=", "#{field}=")
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

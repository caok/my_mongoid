require 'pry'

module MyMongoid
  module Document

    def self.included(base)
      base.extend ClassMethods
      #base.field :_id
      #base.alias_field :id, :_id
      base.send :field, "_id", as: "id"

      MyMongoid.register_model base
    end

    module ClassMethods
      def is_mongoid_model?
        true
      end

      def field(field_name, options={})
        raise DuplicateFieldError if fields.key?(field_name.to_s)

        define_method(field_name.to_s) do
          self.read_attribute field_name.to_s
        end

        define_method("#{field_name}=") do |value|
          self.write_attribute field_name.to_s, value
        end

        fields[field_name.to_s] = MyMongoid::Field.new(field_name.to_s, options)

        field_alias = options.fetch(:as, nil).to_s.strip
        unless field_alias.empty?
          alias_method field_alias, field_name.to_s
          alias_method "#{field_alias}=", field_name.to_s + "="
        end
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
      @attributes ||= {}
      process_attributes(attrs)
      #@attributes = attrs
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

    def process_attributes(attrs = nil)
      attrs ||= {}
      attrs.each_pair do |key, value|
        #raise MyMongoid::UnknownAttributeError unless self.class.respond_to?("#{key}=")
        raise MyMongoid::UnknownAttributeError unless self.class.fields.keys.include? key.to_s
        self.send(key.to_s + '=', value) unless key == 'id'
      end
    end
    alias :attributes= :process_attributes
  end
end

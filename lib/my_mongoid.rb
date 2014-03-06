require "my_mongoid/version"
require "my_mongoid/document"
require "my_mongoid/field"
require "my_mongoid/duplicate_field_error"
require "my_mongoid/configuration"

module MyMongoid
  def self.models
    @models ||= []
  end

  def self.register_model(model)
    models.push(model) unless models.include?(model)
  end

  def self.configuration
    MyMongoid::Configuration.instance
  end

  def self.configure
    yield(self.configuration)
  end
end

require "my_mongoid/version"
require "my_mongoid/document"
require "my_mongoid/field"
require "my_mongoid/duplicate_field_error"

module MyMongoid
  def self.models
    @models ||= []
  end

  def self.register_model(model)
    models.push(model) unless models.include?(model)
  end
end

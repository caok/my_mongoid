require "my_mongoid/version"
require "my_mongoid/document"

module MyMongoid
  def self.models
    @models ||= []
  end

  def self.register_model(model)
    models.push(model) unless models.include?(model)
  end
end

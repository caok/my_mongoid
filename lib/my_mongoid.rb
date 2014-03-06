require "my_mongoid/version"
require "my_mongoid/document"
require "my_mongoid/field"
require "my_mongoid/error"
require "my_mongoid/configuration"
require "moped"

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

  def self.session
    raise UnconfiguredDatabaseError unless configuration.host and configuration.database
    session = Moped::Session.new([configuration.host])
    session.use(configuration.database)
    @session ||= session
  end
end

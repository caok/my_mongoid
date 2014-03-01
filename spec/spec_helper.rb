require "my_mongoid"

RSpec.configure do |config|
  $LOAD_PATH.unshift(File.dirname(__FILE__))
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

  MODELS = File.join(File.dirname(__FILE__), "app/models")
  $LOAD_PATH.unshift(MODELS)

  #Dir[ File.join(MODELS, "*.rb") ].sort.each do |file|
    #name = File.basename(file, ".rb")
    #autoload name.camelize.to_sym, name
  #end

  # Drop all collections and clear the identity map before each spec.
  #config.before(:each) do
    #MyMongoid.purge!
  #end
end

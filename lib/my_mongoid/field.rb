module MyMongoid
  class Field
    attr_accessor :name
    attr_accessor :options

    def initialize(name, options={})
      @name = name
      @options = options
    end
  end
end

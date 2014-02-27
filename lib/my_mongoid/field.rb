module MyMongoid
  class Field
    attr_accessor :name
    attr_accessor :options

    def initialize(name)
      self.name = name
    end
  end
end

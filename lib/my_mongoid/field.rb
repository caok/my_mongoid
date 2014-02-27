module MyMongoid
  class Field
    attr_accessor :name

    def initialize(name)
      self.name = name
    end
  end
end

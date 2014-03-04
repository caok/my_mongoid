describe MyMongoid::Document do
  it "is a module" do
    expect(MyMongoid::Document).to be_a(Module)
  end

  describe "classMethods: " do
    it "is a module" do
      expect(MyMongoid::Document).to be_a(Module)
    end

    it "is a mongoid model" do
      expect(Event.is_mongoid_model?).to eq(true)
    end

    it "maintain a list of models" do
      expect(MyMongoid.models).to include(Event)
    end

    it "maintains a map fields objects" do
      expect(Event.fields).to be_a(Hash)
      expect(Event.fields.keys).to include(*%w(public created_at))
    end
  end

  describe ".new"
  describe "#read_attribute"
  describe "#write_attribute"
  describe "#process_attributes"
  describe "#new_record?"
end

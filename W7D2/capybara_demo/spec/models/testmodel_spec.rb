rattributeattributeequire "rails_helper"

RSpec.describe Testmodel, type: :model do
  subject(:inst) { FactoryBot.build(:inst) }
  describe "validation" do
    #shouldamatchers
    it { should validates_presence_of(:name) }
  end

  describe "association" do
    it "should have many "
  end

  describe "class method" do
    describe "::some class function" do
      it "should do something"
    end
  end
end

require "lru"
describe LRUCache do
  let (:lrutest) { LRUCache.new(7) }
  describe "#initialize" do
    it "should accept a integer as the size of the lru cache" do
      expect(lrutest).to be_a(LRUCache)
    end
    it "should set the size of the lru to be the parameter" do
      expect(lrutest.size == 7).to eq true
    end
  end
  describe "#count" do
    it "shoud return the size of current lru" do
      expect(lrutest.count).to eq(0)
      lrutest.add(1)
      expect(lrutest.count).to be(1)
    end
  end
  describe "#add" do
    it "should take a element as parameter" do
      expect { lrutest.add(3) }.not_to raise_error
    end
    it "should update the order" do
      expect(lrutest.show).to eq([])
      lrutest.add(1)
      lrutest.add(3)
      expect(lrutest.show).to eq([3, 1])
      lrutest.add(1)
      lrutest.add(2)
      lrutest.add(3)
      expect(lrutest.show).to eq([3, 2, 1])
    end
    context "when exceeding the size it should delete least used one" do
      it "should delete the least used one" do
        lrutest.add(1)
        lrutest.add(2)
        lrutest.add(3)
        lrutest.add(4)
        lrutest.add(5)
        lrutest.add(6)
        lrutest.add(7)
        lrutest.add(8)
        expect(lrutest.show).to eq([8, 7, 6, 5, 4, 3, 2])
        lrutest.add(2)
        lrutest.add(10)
        expect(lrutest.show).to eq([10, 2, 8, 7, 6, 5, 4])
      end
    end
  end
end

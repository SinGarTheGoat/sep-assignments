include RSpec

require_relative 'heap'
#top down
#left to right
RSpec.describe Heap type: Class do
  let (:root) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:heap_o_shh) {Heap.new(root, pacific_rim)}

  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(root, data)" do
    it "creats the heap" do
      heap_o_shh.insert(root, pacific_rim)
        expect(root.left.title).to eq "Pacific Rim"
    end
  end

end

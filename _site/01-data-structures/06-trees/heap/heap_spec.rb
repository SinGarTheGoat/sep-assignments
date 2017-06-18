include RSpec

require_relative 'heap'
#top down
#left to right
RSpec.describe Heap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:heap_o_shh) {Heap.new(root)}

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

  describe "#insert(node)" do
    it "creates the heap with a left node" do
      heap_o_shh.insert(pacific_rim, district)
      heap_o_shh.node_array[4]
      expect(root.left.title).to eq "District 9"
    end
  #   it "creates the heap with a full second level" do
  #     heap_o_shh.insert(root, pacific_rim)
  #     heap_o_shh.insert(root, braveheart)
  #     expect(root.left.title).to eq "The Matrix"
  #     expect(root.right.title).to eq "Braveheart"
  #   end
  #
  #   it "creates the heap with a full third level and a swap" do
  #     heap_o_shh.insert(root, pacific_rim)
  #     heap_o_shh.insert(root, braveheart)
  #     heap_o_shh.insert(root, district)
  #     heap_o_shh.insert(root, jedi)
  #     heap_o_shh.insert(root, shawshank)
  #     heap_o_shh.insert(root, martian)
  #     expect(root.left).to eq "Star Wars: Return of the Jedi"
  #     expect(root.left.right).to eq "The Matrix"
  #   end
   end

  describe "#print(root)" do
    it "prints a 2 node tree" do
      heap_o_shh.insert(pacific_rim, root)
      expect(root.left.title).to eq "The Matrix"
    end
  end

end

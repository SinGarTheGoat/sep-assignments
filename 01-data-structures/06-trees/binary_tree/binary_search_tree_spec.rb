include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
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

  describe "#insert(data)" do
    it "confirm The Matrix is at the root" do
      expect(root.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left child" do
      tree.insert(pacific_rim)
      expect(root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert( braveheart)
      tree.insert( pacific_rim)
      expect(root.left.left.title).to eq "Pacific Rim"
    end


    it "properly inserts a new node as a left-right child" do
      tree.insert( donnie)
      tree.insert( inception)
      expect(root.left.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert( district)
      expect(root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert( hope)
      tree.insert( martian)
      expect(root.right.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert( empire)
      tree.insert( mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert( empire)
      tree.insert( mad_max_2)
      expect(tree.find(nil)).to eq nil
    end

    it "properly finds a left node" do #in progress
      tree.insert( pacific_rim)
      tree.printf(root)
      expect(tree.find(pacific_rim.rating).title).to eq "Pacific Rim"
    end







    it "properly finds a left-left node" do
      tree.insert( braveheart)
      tree.insert( pacific_rim)
      expect(tree.find(pacific_rim.rating).title).to eq "Pacific Rim"
    end

    it "properly finds a left-right node" do
      tree.insert( donnie)
      tree.insert( inception)
      expect(tree.find(inception.rating).title).to eq "Inception"
    end

    it "properly finds a right node" do
      tree.insert( district)
      expect(tree.find(district.rating).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      tree.insert( hope)
      tree.insert( martian)
      expect(tree.find(martian.rating).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      tree.insert( empire)
      tree.insert( mad_max_2)
      expect(tree.find(mad_max_2.rating).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(hope)
      tree.delete(root, hope.rating)
      expect(tree.find(hope.rating)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert( braveheart)
      tree.insert( pacific_rim)
      tree.delete(root, pacific_rim.rating)
      expect(tree.find(pacific_rim.rating)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert( donnie)
      tree.insert( inception)
      tree.delete(root, inception.rating)
      expect(tree.find(inception.rating)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert( district)
      tree.delete(root, district.rating)
      expect(tree.find(district.rating)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert( hope)
      tree.insert( martian)
      tree.delete(root, martian.rating)
      expect(tree.find(martian.rating)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert( empire)
      tree.insert( mad_max_2)
      tree.delete(root, mad_max_2.rating)
      expect(tree.find(mad_max_2.rating)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
       tree.insert( hope)
       tree.insert( empire)
       tree.insert( jedi)
       tree.insert( martian)
       tree.insert( pacific_rim)
       tree.insert( inception)
       tree.insert( braveheart)
       tree.insert( shawshank)
       tree.insert( district)
       tree.insert( mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       tree.insert( mad_max_2)
       tree.insert( district)
       tree.insert( shawshank)
       tree.insert( braveheart)
       tree.insert( inception)
       tree.insert( pacific_rim)
       tree.insert( martian)
       tree.insert( jedi)
       tree.insert( empire)
       tree.insert( hope)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end

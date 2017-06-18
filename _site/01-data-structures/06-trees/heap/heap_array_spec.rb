include RSpec

require_relative 'heap-array'

RSpec.describe Heap, type: Class do

  let (:heap_o_shh) {Heap.new}
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:matrix) { Node.new("The Matrix", 87) }
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

  describe 'insert' do
    it 'creates heap with one node' do #DONE
      heap_o_shh.insert(pacific_rim)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
    end

    it 'creates a heap with 3 nodes and no rearainging required' do #DONE
      heap_o_shh.insert(pacific_rim)
      heap_o_shh.insert(matrix)
      heap_o_shh.insert(hope)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'The Matrix'
      expect(heap_o_shh.heap_array[2].title).to eq 'Star Wars: A New Hope'
    end

    it 'creates a heap with 7 nodes and no rearainging required' do #DONE
      heap_o_shh.insert(pacific_rim)
    #  puts heap_o_shh.heap_array
      heap_o_shh.insert(jedi)
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(donnie)
      heap_o_shh.insert(inception)
      heap_o_shh.insert(district)
      heap_o_shh.insert(shawshank)
      #puts heap_o_shh.heap_array
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
      expect(heap_o_shh.heap_array[2].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[3].title).to eq 'Donnie Darko'
      expect(heap_o_shh.heap_array[4].title).to eq 'Inception'
      expect(heap_o_shh.heap_array[5].title).to eq 'District 9'
      expect(heap_o_shh.heap_array[6].title).to eq 'The Shawshank Redemption'
    end


    it 'creates a heap with  nodes and no rearainging required' do #DONE
      heap_o_shh.insert(pacific_rim)
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(jedi)
      heap_o_shh.insert(matrix)
      heap_o_shh.insert(mad_max_2)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[2].title).to eq 'Star Wars: Return of the Jedi'
      expect(heap_o_shh.heap_array[3].title).to eq 'The Matrix'
      expect(heap_o_shh.heap_array[4].title).to eq 'Mad Max 2: The Road Warrior'
    end


    it 'creates a heap with 3 nodes and rearainging required' do
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(matrix)
      heap_o_shh.insert(pacific_rim)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'The Matrix'
      expect(heap_o_shh.heap_array[2].title).to eq 'Braveheart'
    end

    it 'creates a heap with 7 nodes and rearainging required' do

    #  puts heap_o_shh.heap_array
      heap_o_shh.insert(jedi)
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(donnie)
      heap_o_shh.insert(inception)
      heap_o_shh.insert(district)
      heap_o_shh.insert(shawshank)
      heap_o_shh.insert(pacific_rim)
      #puts heap_o_shh.heap_array
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
      expect(heap_o_shh.heap_array[2].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[3].title).to eq 'Inception'
      expect(heap_o_shh.heap_array[4].title).to eq 'District 9'
      expect(heap_o_shh.heap_array[5].title).to eq 'The Shawshank Redemption'
      expect(heap_o_shh.heap_array[6].title).to eq 'Donnie Darko'
    end

  end




  describe 'find' do
    it "returns true and prints the node if node is in the array" do
      heap_o_shh.insert(jedi)
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(donnie)
      heap_o_shh.insert(inception)
      heap_o_shh.insert(district)
      heap_o_shh.insert(shawshank)
      heap_o_shh.insert(pacific_rim)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
      expect(heap_o_shh.heap_array[2].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[3].title).to eq 'Inception'
      expect(heap_o_shh.heap_array[4].title).to eq 'District 9'
      expect(heap_o_shh.heap_array[5].title).to eq 'The Shawshank Redemption'
      expect(heap_o_shh.heap_array[6].title).to eq 'Donnie Darko'
      expect(heap_o_shh.find(pacific_rim)).to eq true
    end
    it "returns false if  node is not in the array" do
      heap_o_shh.insert(jedi)
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(donnie)
      heap_o_shh.insert(inception)
      heap_o_shh.insert(district)
      heap_o_shh.insert(shawshank)
      heap_o_shh.insert(pacific_rim)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
      expect(heap_o_shh.heap_array[2].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[3].title).to eq 'Inception'
      expect(heap_o_shh.heap_array[4].title).to eq 'District 9'
      expect(heap_o_shh.heap_array[5].title).to eq 'The Shawshank Redemption'
      expect(heap_o_shh.heap_array[6].title).to eq 'Donnie Darko'
      expect(heap_o_shh.find(mad_max_2)).to eq false
    end
  end
  describe 'delete' do
    it "deletes a bottom node and keeps the integrity of the heap" do
    heap_o_shh.insert(braveheart)
    heap_o_shh.insert(jedi)
    heap_o_shh.insert(shawshank)
    expect(heap_o_shh.heap_array[0].title).to eq 'Braveheart'
    expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
    expect(heap_o_shh.heap_array[2].title).to eq 'The Shawshank Redemption'
    heap_o_shh.delete(shawshank)
    expect(heap_o_shh.heap_array[0].title).to eq 'Braveheart'
    expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
    expect(heap_o_shh.heap_array[2]).to eq nil
    end
    it "deletes top node and keeps integerty of the stack " do
      heap_o_shh.insert(jedi)
      heap_o_shh.insert(braveheart)
      heap_o_shh.insert(donnie)
      heap_o_shh.insert(inception)
      heap_o_shh.insert(district)
      heap_o_shh.insert(shawshank)
      heap_o_shh.insert(pacific_rim)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'
      expect(heap_o_shh.heap_array[2].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[3].title).to eq 'Inception'
      expect(heap_o_shh.heap_array[4].title).to eq 'District 9'
      expect(heap_o_shh.heap_array[5].title).to eq 'The Shawshank Redemption'
      expect(heap_o_shh.heap_array[6].title).to eq 'Donnie Darko'
      heap_o_shh.delete(pacific_rim)
      expect(heap_o_shh.heap_array[0].title).to eq 'Braveheart'
      expect(heap_o_shh.heap_array[1].title).to eq 'Star Wars: Return of the Jedi'

      expect(heap_o_shh.heap_array[2].title).to eq 'Donnie Darko'

      expect(heap_o_shh.heap_array[3].title).to eq 'Inception'
      expect(heap_o_shh.heap_array[4].title).to eq 'District 9'
      expect(heap_o_shh.heap_array[5].title).to eq 'The Shawshank Redemption'

    end

    it 'returns false when the node is not in heap' do #DONE
      heap_o_shh.insert(pacific_rim)
      heap_o_shh.insert(matrix)
      heap_o_shh.insert(hope)
      expect(heap_o_shh.heap_array[0].title).to eq 'Pacific Rim'
      expect(heap_o_shh.heap_array[1].title).to eq 'The Matrix'
      expect(heap_o_shh.heap_array[2].title).to eq 'Star Wars: A New Hope'
      expect(heap_o_shh.delete(mad_max_2)).to eq false
    end
  end



    describe "#print" do #DONE
      before do
        heap_o_shh.insert(jedi)
        heap_o_shh.insert(braveheart)
        heap_o_shh.insert(donnie)
      end
      specify { expect { heap_o_shh.print }.to output("Braveheart 78\nStar Wars: Return of the Jedi 80\nDonnie Darko 85\n").to_stdout }
    end

end

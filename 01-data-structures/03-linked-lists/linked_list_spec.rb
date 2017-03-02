include RSpec

require_relative 'node'
require_relative 'linked_list'

RSpec.describe LinkedList, type: Class do
  let(:n1) { Node.new("Rob") }
  let(:n2) { Node.new("Ben") }
  let(:n3) { Node.new("Mike") }
  let(:llist) { LinkedList.new }

  describe "#add_to_tail" do #DONE
    it "adds a Node to the tail" do
      llist.add_to_tail(n1)
      expect(llist.tail).to eq n1
      llist.add_to_tail(n2)
      expect(llist.tail).to eq n2
    end
  end

  describe "#remove_tail" do #DONE
    it "removes nodes from the tail" do
      llist.add_to_tail(n1)
      llist.add_to_tail(n2)
      expect(llist.tail).to eq n2
      llist.remove_tail

      expect(llist.tail).to eq n1
      llist.remove_tail
      expect(llist.tail).to eq nil
    end
  end

  describe "#print" do #DONE
    before do
      llist.add_to_tail(n1)
      llist.add_to_tail(n2)
    end

    specify { expect { llist.print }.to output("Rob\nBen\n").to_stdout }
  end

  describe "#delete" do
    before do
      llist.add_to_tail(n1)
      llist.add_to_tail(n2)
      llist.add_to_tail(n3)
    end

    it "removes the head of a list properly" do #done
      llist.delete(n1)
      expect(llist.head).to eq n2
      expect(llist.head.next).to eq n3
      expect(llist.tail).to eq n3
    end

    it "removes the middle element of a list properly" do
      llist.delete(n2)
      expect(llist.head).to eq n1
      expect(llist.head.next).to eq n3
      expect(llist.tail).to eq n3
    end

    it "removes the last element of a list properly" do
      llist.delete(n3)
      expect(llist.head).to eq n1
      expect(llist.head.next).to eq n2
      expect(llist.tail).to eq n2
    end
  end

  describe "#add_to_front" do
    it "adds the node to the front of the linked list" do
      llist.add_to_front(n1)
      expect(llist.head).to eq n1
      llist.add_to_front(n2)
      expect(llist.head).to eq n2
    end
  end

  describe "#remove_front" do
    it "removes the node to the front of the linked list" do
      llist.add_to_front(n1)
      expect(llist.head).to eq n1
      llist.add_to_front(n2)
      expect(llist.head).to eq n2
      llist.remove_front
      expect(llist.head).to eq n1
      llist.remove_front
      expect(llist.head).to eq nil
    end
  end



#I MADE THESE
  describe "#insert_node_index_specfic" do
    it "inserts a node at front" do
      llist.insert_node_index_specfic(n3, 0)
      expect(llist.head).to eq n3
    end

    it "inserts node in middle" do

      llist.add_to_front(n1)
      expect(llist.head).to eq n1
      llist.add_to_front(n2)
      expect(llist.head).to eq n2
      llist.insert_node_index_specfic(n3, 1)
      llist.remove_front
      expect(llist.head).to eq n3
    end
  end

  describe "#return_at" do #DONE
    before do
      llist.add_to_tail(n1)
      llist.add_to_tail(n2)
      llist.add_to_tail(n3)
    end
    specify { expect { llist.return_at(1) }.to output("Ben\n").to_stdout }
  end

  # describe "#delete_at" do
  #   before do
  #     llist.add_to_tail(n1)
  #     llist.add_to_tail(n2)
  #     llist.add_to_tail(n3)
  #   end
  #   it "deletes a node at a given index" do
  #     llist.delete_at(1)
  #     expect(llist.head).to eq n1
  #     expect(llist.tail).to eq n3
  #     expect()
  #   end
  # end



end

include RSpec

require_relative 'node'
require_relative 'tsp_greed'
require_relative 'node2'


RSpec.describe Shorttrip, type: Class do

  let(:funk){Node.new("Funky Town", -2, 0)}
  let(:happy){Node.new("Happyville", -2, 1)}
  let(:my){Node.new("My Foot", 0, 2)}
  let(:your){Node.new("Your Ass", 1, 2) }
  let(:delray){Node.new("Detroit", 3, -2)}

  let(:trip) {Shorttrip.new}

  describe "#add_city" do
    it "adds a city to the array and calculates how far to the other citys.s" do
      trip.add_city(funk)
      trip.add_city(happy)
      trip.add_city(my)
      trip.add_city(your)
      trip.add_city(delray)
    end
  end



  describe "#n_n" do
    it "starts from the current ciyt and finds the shorts route" do
      trip.add_city(funk)
      trip.add_city(happy)
      trip.add_city(my)
      trip.add_city(your)
      trip.add_city(delray)
      trip.n_n(delray)
    end
  end


end

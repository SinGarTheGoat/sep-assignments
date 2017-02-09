# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    doodAt = members.index(person)
    members.delete_at(doodAt)
            #or
    #members.delete(person)
  end

  def front
    members.first
  end

  def middle
    mid = members.length/2
    members[mid]
  end

  def back
    members.last
  end

  def search(person)
    dudeAt = members.index(person)
    members[dudeAt]
  end

  private

  def index(person)
  end

end

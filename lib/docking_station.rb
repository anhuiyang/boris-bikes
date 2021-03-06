require_relative './bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
  end


  def release_bike
    fail "no bike" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "no capacity" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end
end

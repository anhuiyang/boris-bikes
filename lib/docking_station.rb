require_relative './bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail "no bike" unless @bike != nil
    @bike
  end

  def dock(bike)
    fail "no capacity" unless @bike == nil
    @bike = bike
  end

end

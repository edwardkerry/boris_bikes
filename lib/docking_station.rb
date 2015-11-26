require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY=20
attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bikes)
    fail 'Station is full' if full?
    @bikes << bikes
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def bikes
    @bikes
  end



  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.count == 0
  end
end
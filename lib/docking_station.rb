require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  def dock(bikes)
    fail 'Capacity is full' if @bikes.count >= 20
    @bikes << bikes
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def bikes
    @bikes
  end
end
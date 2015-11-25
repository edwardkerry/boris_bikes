require_relative 'bike'

DEFAULT_CAPACITY=20

class DockingStation

  def initialize
    @bikes = []
  end

  def bikes
    @bikes
  end

  def dock(bikes)
    fail 'Capacity is full' if full?
    @bikes << bikes
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  private

  def full?
    if @bikes.count >= DEFAULT_CAPACITY
      return true
    else
      return false
    end
  end

  def empty?
    if @bikes.count == 0
      return true
    else
      return false
    end
  end
end
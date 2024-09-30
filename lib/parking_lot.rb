class ParkingLot
  attr_reader :spots

  def initialize(slots)
    @spots = Array.new(slots) # Array of nil values
  end
end

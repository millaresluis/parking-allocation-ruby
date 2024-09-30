require_relative 'parking_lot'
require_relative 'vehicle'

class ParkingAllocation
  def initialize(slots)
    @parking_lot = ParkingLot.new(slots)
  end
end
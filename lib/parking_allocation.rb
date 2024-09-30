require_relative 'parking_lot'
require_relative 'vehicle'

class ParkingAllocation
  def initialize(slots)
    @parking_lot = ParkingLot.new(slots)
  end

  def park(color, registration_number)
    vehicle = Vehicle.new(color, registration_number)
    @parking_lot.park_vehicle(vehicle)
  end

  def leave(slot_number)
    @parking_lot.leave_vehicle(slot_number)
  end
  
  def status
    @parking_lot.parking_status
  end

  def plate_numbers_for_cars_with_colour(color)

  end

  def slot_numbers_for_cars_with_colour(color)

  end

  def slot_number_for_registration_number 

  end
end
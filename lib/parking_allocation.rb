require_relative 'parking_lot'
require_relative 'vehicle'

class ParkingAllocation
  def initialize(slots)
    @parking_lot = ParkingLot.new(slots)
  end

  def park(vehicle_color, vehicle_number)
    vehicle = Vehicle.new(vehicle_color, vehicle_number)
    @parking_lot.park_vehicle(vehicle)
  end

  def leave(slot_number)
    @parking_lot.leave_vehicle(slot_number)
  end
  
  def status
    @parking_lot.parking_status
  end

  def plate_numbers_for_cars_with_colour(vehicle_color)
    @parking_lot.find_vehicles_by_color(vehicle_color)
  end

  def slot_numbers_for_cars_with_colour(vehicle_color)
    @parking_lot.find_slots_by_attribute('color', vehicle_color)
  end

  def slot_number_for_registration_number(vehicle_number) 
    @parking_lot.find_slots_by_attribute('registration_number', vehicle_number)
  end
end

require_relative 'lib/parking_allocation.rb'

slots = gets.chomp.to_i

parking_allocation_system = ParkingAllocation.new(slots)

loop do
  input= gets.chomp.split
  action = input[0]

  case action
  when 'park'

  when 'leave'

  when 'status'

  when 'plate_numbers_for_cars_with_colour'

  when 'slot_numbers_for_cars_with_colour'

  when 'slot_number_for_registration_number'

  else
    puts "Invalid input."
  end
end

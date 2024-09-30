require_relative 'lib/parking_allocation.rb'

parking_allocation_system = nil

loop do
  input= gets.chomp.split
  action = input[0]

  if parking_allocation_system.nil? && action != 'create_parking_lot'
    puts "Please create a parking lot first."
    next
  end

  unless input[1] || action == 'status'
    puts "Please enter a valid number."
    next
  end

  # Run app action
  case action
  when 'create_parking_lot'
    slots = input[1].to_i

    if slots > 0
      parking_allocation_system = ParkingAllocation.new(slots)
      puts "Created a parking lot with #{slots} slots."
    else
      puts "Please enter a valid number."
    end
  when 'park'
    vehicle_number = input[1]
    vehicle_color = input[2]

    parking_allocation_system.park(vehicle_color, vehicle_number)
  when 'leave'
    parking_allocation_system.leave(input[1])
  when 'status'
    parking_allocation_system.status
  when 'plate_numbers_for_cars_with_colour'

  when 'slot_numbers_for_cars_with_colour'

  when 'slot_number_for_registration_number'

  else
    puts "Invalid input."
  end
end

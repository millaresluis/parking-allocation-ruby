require_relative 'lib/parking_allocation.rb'

@parking_allocation_system = nil

def process(input:, action:, data:)
  case action
  when 'create_parking_lot'
    @parking_allocation_system = ParkingAllocation.new(data.to_i)
    puts "Created a parking lot with #{data} slots."
  when 'park'
    vehicle_number = input[1]
    vehicle_color = input[2]

    @parking_allocation_system.park(vehicle_color, vehicle_number)
  when 'leave'
    @parking_allocation_system.leave(data)
  when 'status'
    @parking_allocation_system.status
  when 'plate_numbers_for_cars_with_colour'
    @parking_allocation_system.plate_numbers_for_cars_with_colour(data)
  when 'slot_numbers_for_cars_with_colour'
    @parking_allocation_system.slot_numbers_for_cars_with_colour(data)
  when 'slot_number_for_registration_number'
    @parking_allocation_system.slot_number_for_registration_number(data)
  else
    puts "Invalid input."
  end
end

if ARGV.empty?
  loop do
    input= gets.chomp.split
    action = input[0]
    data = input[1]
  
    if @parking_allocation_system.nil? && action != 'create_parking_lot'
      puts "Please create a parking lot first."
      next
    end
  
    unless data || action == 'status'
      puts "Please enter a valid number."
      next
    end
  
    process(
      input: input,
      action: action,
      data: data
    )
  end
end

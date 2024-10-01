class ParkingLot
  def initialize(slots)
    @slots = Array.new(slots) # Array of nil values
  end

  def park_vehicle(vehicle)
    empty_slot = @slots.index(nil)

    if empty_slot
      @slots[empty_slot] = vehicle
      puts "Allocated slot_number: #{empty_slot + 1}"
    else
      puts "Sorry, parking lot is full."
    end
    
    puts ""
  end

  def leave_vehicle(slot_number)
    occupied_slot = slot_number.to_i - 1

    if @slots[occupied_slot]
      @slots[occupied_slot] = nil
      puts "Slot number #{slot_number} is free"
    else
      puts "Slot number is empty."
    end

    puts ""
  end
  
  def parking_status
    if @slots.compact.any?
      puts "Slot No. | Plate No. | Colour"
      @slots.each_with_index do |vehicle, index|
        puts "#{index + 1} | #{vehicle.registration_number} | #{vehicle.color}" if vehicle
      end
    else
      puts "All parking slots (#{@slots.size}) are available."
    end

    puts ""
  end

  def find_vehicles_by_color(color)
    vehicles = @slots.compact.select { |vehicle| vehicle.color == color }

    puts vehicles.any? ? vehicles.map(&:registration_number).join(", ") : "Not found."
    puts ""
  end

  def find_slots_by_attribute(attribute, value)
    slots = @slots.each_with_index.select do |vehicle, index|
              attribute == 'color' ? vehicle.color == value : vehicle.registration_number == value if vehicle
            end

    puts slots.any? ? slots.map { |object, index| index + 1 }.join(", ") : "Not found."
    puts ""
  end
end

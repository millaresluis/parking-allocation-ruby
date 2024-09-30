class ParkingLot
  attr_reader :spots

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
  end

  def leave_vehicle(slot_number)
    occupied_slot = slot_number.to_i - 1

    if @slots[occupied_slot]
      @slots[occupied_slot] = nil
      puts "Slot number #{slot_number} is free"
    else
      puts "Slot number is empty."
    end
  end
  
  def parking_status
    if @slots.compact.any?
      puts "Slot No. | Registration No. | Color"
      @slots.each_with_index do |vehicle, index|
        puts "#{index + 1} | #{vehicle.registration_number} | #{vehicle.color}" if vehicle
      end
    else
      puts "All parking slots (#{@slots.size}) are available."
    end
  end

  def find_plates_by_color(color)
    vehicles = @slots.compact.select { |vehicle| vehicle.color == color }

    puts vehicles.any? ? vehicles.map(&:registration_number).join(", ") : "Not found."
  end
  
  def find_slots_by_color(color)
    slots = @slots.each_with_index.select { |vehicle, index| vehicle && vehicle.color == color }

    puts slots.any? ? slots.map { |object, index| index + 1 }.join(", ") : "Not found."
  end
end

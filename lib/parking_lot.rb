class ParkingLot
  attr_reader :spots

  def initialize(slots)
    @slots = Array.new(slots) # Array of nil values
  end

  def park_vehicle(vehicle)
    empty_spot = @slots.index(nil)

    if empty_spot
      @slots[empty_spot] = vehicle
      puts "Allocated slot_number: #{empty_spot + 1}"
    else
      puts "Sorry, parking lot is full."
    end
  end

  def leave_vehicle(slot_number)
    index = slot_number.to_i - 1

    if @slots[index]
      @slots[index] = nil
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
end

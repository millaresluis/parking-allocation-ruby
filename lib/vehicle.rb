class Vehicle
  attr_reader :color, :registration_number

  def initialize(color, registration_number)
    @color = color
    @registration_number = registration_number
  end
end

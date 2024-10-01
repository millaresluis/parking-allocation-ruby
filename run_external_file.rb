require_relative 'main'

file_path = ARGV[0]

if file_path.nil?
  puts "No file found."
  exit
end

IO.foreach(file_path) do |command|
  input = command.chomp.split
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

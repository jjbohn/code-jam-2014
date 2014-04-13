input = File.open("input-small.in", "r")
output = File.open("output", "w")
test_cases = input.gets.strip.to_i
test_cases.times do |i|
  row = ->(inp) do
    r = input.gets.strip.to_i - 1
    grid = []
    4.times { |j| grid[j] = input.gets.strip.split(" ") }
    grid[r]
  end

  intersect = row.call(input) & row.call(input)
  answer = case intersect.length
              when 0; "Volunteer cheated!"
              when 1; intersect[0]
              else;   "Bad magician!"
            end

  output.puts "Case ##{i + 1}: #{answer}"
end

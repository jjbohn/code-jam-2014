input = File.open("input-small.in", "r")
output = File.open("output", "w")
test_cases = input.gets.strip.to_i
test_cases.times do |t|
  cookies_per_sec = 2.0
  farm_cost, farm_cookies_per_sec, goal = input.gets.strip.split(" ").map(&:to_f)

  best_case_farm = 0
  best_case_goal = nil
  while
    sec_from_farm = farm_cost / cookies_per_sec
    sec_from_goal = goal / cookies_per_sec

    if !best_case_goal.nil? && best_case_goal <= best_case_farm + sec_from_goal
      break
    end

    best_case_goal = best_case_farm + sec_from_goal
    best_case_farm += sec_from_farm
    cookies_per_sec += farm_cookies_per_sec
  end

  output.puts("Case ##{t + 1}: #{"%.7f" % best_case_goal}")
end

#Pi cycle time analyzer, calculating dates matching key pi cycle time analysis
#
require 'Date'
# Start date and time, preferably midnight (but this could be made more accurate) for time series analysis to begin
start_date = Date.parse("29 November 1972")
puts("We are starting from the date of: " )
puts (start_date.to_s)
puts "MID LEVEL CYCLE DATE"

# short pi cycle time in days
SCP = 8.615384615

def calculate_subcycle(sub_cycle_rolling_date)
  sub_count = 0
  while sub_count < 4
    sub_cycle_rolling_date = sub_cycle_rolling_date + ((8.615384615 / 4) * 365.25)
    puts "---------------------------"
    puts "     " + sub_cycle_rolling_date.strftime("%Y %B %d").to_s
    puts "     sub cycle date"
    sub_count = sub_count + 1
  end
end

# store results of the key dates the analyzer comes out with
key_pi_cycle_dates = Array.new()

# counter to control how far in the future we go
counter = 0

# rolling date to calculate on, access to this is needed as we go
rolling_date = start_date
calculate_subcycle(rolling_date)
while rolling_date.strftime("%Y").to_i < 2040
  counter = counter + 1
  puts "=================================="

  rolling_date = rolling_date + (SCP * 365.25)
  puts (rolling_date.strftime("%Y %B %d").to_s)
  key_pi_cycle_dates.push(rolling_date.strftime("%Y%m"))
  if (counter % 6).zero?
    puts "MID LEVEL CYCLE DATE"
  else
    #puts "MINOR CYCLE DATE"
  end

  if (counter % 36).zero?
    puts "MAJOR LEVEL DATE"
  end

  calculate_subcycle(rolling_date)

end


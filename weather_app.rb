require "yahoo_weatherman"

puts "Please enter a zip code for 5 day weather forecast."
location = gets.chomp

#convert to Fahrenheit 

def get_location(location)

client = Weatherman::Client.new :unit => 'F'
client.lookup_by_location(location)

end
 
forecast = get_location(location).forecasts 

#sets weekdays from 0 to 6 

today = Time.now.strftime('%w').to_i
tomorrow = today + 1

forecast.each do |forecast|
 
day = forecast['date']

weekday = day.strftime('%w').to_i

if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end
 
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
 
end
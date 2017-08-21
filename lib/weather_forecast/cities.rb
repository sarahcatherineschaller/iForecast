class WeatherForecast::Cities
	attr_accessor :name, :temperature, :humidity, :forecast, :url

	def self.today
		puts "Choose a city to see the current weather forecast:"
		#'here doc's are like giant strings"
		puts <<-DOC.gsub /^\s*/, ''
			1. New York, NY
			2. Boston, MA
			3. San Francisco, CA
			4. Austin, TX 
			5. Seattle, WA
			6. Orlando, FL
			7. Phoenix, AZ
			8. Washington, D.C.
			9. Denver, CO
			10. Hartford, CT
		DOC

		city_1 = self.new
		city_1.name = "New York, NY"
		city_1.temperature = 84
		city_1.humidity = "89%"
		city_1.forecast = "Mostly cloudy"
		city_1.url = "https://weather.com/weather/today/l/USNY0996:1:US"

		city_2 = self.new
		city_2.name = "Boston, MA"
		city_2.temperature = 82
		city_2.humidity = "43%"
		city_2.forecast = "Partly cloudy"
		city_2.url = "https://weather.com/weather/today/l/USMA0046:1:US"

		[city_1, city_2]
	end


end
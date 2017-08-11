class WeatherForecast::CLI

	def call 
		list_cities
		choose_city
	end

	def list_cities 
		puts "Choose a city to see the current weather forecast:"
		#'here doc's are like giant strings"
		puts <<-DOC.gsub /^\s*/, ''
			1.  New York, NY
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
	end

	def choose_city
		input = gets.strip
		until input.to_i > 0 && input.to_i < 11
			puts "Please enter a number 1-10"
			input = gets.strip
		end
		forecast_list
    end

    def forecast_list
    	puts "Do you want to know the weather:"
    	puts "1. Right now"
    	puts "2. Hourly"
    	puts "3. 5 day forecast"
    end



end
class WeatherForecast::CLI

	def call 
		list_cities
	end

	def list_cities 

		puts "Choose a city to see the current weather forecast:"
		WeatherForecast::Cities.clear_all 
		city_menu
	end

	def city_menu
	    puts <<~DOC
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
		input = gets.strip
		until input.to_i > 0 && input.to_i < 11
			puts "Please enter a number 1-10"
			input = gets.strip
		end
		forecast_type
    end

    def forecast_type
    	puts "Choose a number to see the current forecast:"
    	puts <<~DOC
    	    1. Forecast
    	    2. Temperature
    	    3. Visibility
    	    4. Humidity
        DOC
        forecast_choice
	end

	def forecast_choice
		input = gets.strip
        until input.to_i > 0 && input.to_i < 5
        	puts "Please enter a number 1-4"
        	input = gets.strip
        end
		if input == "1"
			puts "Mostly Cloudy"
		elsif input == "2"
			puts "It is currently 67 degrees F in New York, NY"
		elsif input == "3"
			puts "7.0 miles"
		elsif input == "4"
			puts "43 percent humidity"
		end
		start_over
	end


	def start_over 
		puts "Enter 'cities' to see the list of cities again, or 'exit'"
        input = gets.strip.downcase 
		until input == "cities" || input == "exit"
			puts "Please enter your choice again"
		end
		case input
		when "cities"
			list_cities
		when "exit"
			puts "Goodbye!"
		end
	end



end
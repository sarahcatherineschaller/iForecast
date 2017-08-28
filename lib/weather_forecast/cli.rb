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
		city_url
    end

    def city_url
        input = gets.strip
		@cities = WeatherForecast::Cities.today
		@the_city = @cities[input.to_i-1]
		until input.to_i > 0 && input.to_i < 11
			puts "Please enter a number 1-10"
			input = gets.strip
		end
		if input == "1"
			WeatherForecast::Cities.scrape_city("https://weather.com/weather/today/l/USNY0996:1:US")
		elsif input == "2"
			WeatherForecast::Cities.scrape_city("https://weather.com/weather/today/l/USMA0046:1:US")
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
        # @cities.each.with_index(1) do |city, index|
        # 	puts "#{index}. #{city.forecast}"
        # end
		input = gets.strip
        until input.to_i > 0 && input.to_i < 5
        	puts "Please enter a number 1-4"
        	input = gets.strip
        end
		if input == "1"
			puts "#{@the_city.forecast}"
		elsif input == "2"
			puts "It is currently #{@the_city.temperature} in #{@the_city.name}"
		elsif input == "3"
			puts "#{@the_city.visibility}"
		elsif input == "4"
			puts "#{@the_city.humidity}"
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
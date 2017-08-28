class WeatherForecast::CLI

	def call 
		list_cities
	end

	def list_cities 
		puts " "
		puts "Choose a city to see the current weather forecast:"
		puts " "

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
		puts " "

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
			WeatherForecast::Cities.scrape_newyork
		elsif input == "2"
			WeatherForecast::Cities.scrape_boston
		elsif input == "3"
			WeatherForecast::Cities.scrape_sanfran
		elsif input == "4"
			WeatherForecast::Cities.scrape_austin
		elsif input == "5"
			WeatherForecast::Cities.scrape_seattle
		elsif input == "6"
			WeatherForecast::Cities.scrape_orlando
		elsif input == "7"
			WeatherForecast::Cities.scrape_phoenix
		elsif input == "8"
			WeatherForecast::Cities.scrape_dc
		elsif input == "9"
			WeatherForecast::Cities.scrape_denver
		elsif input == "10"
			WeatherForecast::Cities.scrape_hartford
		end

		forecast_type
	end

    def forecast_type
    	puts " "
    	puts "Choose a number to see the current forecast:"
    	puts " "
    	puts <<~DOC
    	    1. Forecast
    	    2. Temperature
    	    3. High/Low
    	    4. Humidity
    	    5. Sunrise/Sunset
        DOC
        puts " "

        forecast_choice
	end

	def forecast_choice
		input = gets.strip

        until input.to_i > 0 && input.to_i < 6
        	puts "Please enter a number 1-5"
        	input = gets.strip
        end

		if input == "1"
			puts " "
			puts "The weather is currently #{@the_city.forecast}."
		elsif input == "2"
			puts " "
			puts "It is currently #{@the_city.temperature} F, and #{@the_city.feels_like} F."
		elsif input == "3"
			puts " "
			puts "High: #{@the_city.high}, Low: #{@the_city.low}"
		elsif input == "4"
			puts " "
			puts "The humidity is #{@the_city.humidity}."
		elsif input == "5"
			puts " "
			puts "Sunrise: #{@the_city.sunrise}, Sunset: #{@the_city.sunset}"
		end

		start_over
	end


	def start_over 
		puts " "
		puts "Enter 'back' to go back to the list of forecast choices,"
		puts "enter 'cities' to see the list of cities, or 'exit'"
		puts " "

        input = gets.strip.downcase 

		until input == "back" || input == "cities" || input == "exit"
			puts "Please enter your choice again"
			input = gets.strip.downcase
		end

		case input
		when "back"
			forecast_type
		when "cities"
			list_cities
		when "exit"
			puts " "
			puts "Goodbye!"
			puts " "
		end
	end

end
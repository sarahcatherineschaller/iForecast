class WeatherForecast::CLI

	def call 
		puts "Choose a number to see the current weather forecast:"
		list_cities
	end

	def list_cities 
		puts <<-DOC 
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

end
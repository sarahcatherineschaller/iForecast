class WeatherForecast::CLI

	def call 
		list_cities
	end

	def list_cities 
		puts "Choose a number to see the current weather forecast:"
		#here doc's are like giant strings"
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

end
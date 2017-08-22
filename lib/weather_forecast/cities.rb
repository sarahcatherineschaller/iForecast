
require 'pry'
class WeatherForecast::Cities
	attr_accessor :name, :temperature, :humidity, :visibility, :forecast, :url

    @@all = []

    def self.today
    	self.scrape_cities
    end

    def scrape_cities
    	city_1 = self.new
    	city_1.name = "New York, NY"
    	city_1.temperature = "67 degrees F"
    	city_1.humidity = "43 percent"
    	city_1.visibility = "7.0 miles"
    	city_1.forecast = "Partly cloudy"
    	city_1.url = "https://weather.com/weather/today/l/USNY0996:1:US"

    	city_2 = self.new
    	city_2.name = "Boston, MA"
    	city_2.temperature = "64 degrees F"
    	city_2.humidity = "10 percent"
    	city_2.visibility = "10.0 miles"
    	city_2.forecast = "Sunny"
    	city_2.url = "https://weather.com/weather/today/l/USMA0046:1:US"

    	[city_1, city_2]
    end

    def self.all 
    	@@all 
    end

    def save 
    	@@all << self 
    end

    def self.clear_all
    	@@all.clear 
    end


end
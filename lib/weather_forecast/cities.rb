
require 'pry'

class WeatherForecast::Cities
	attr_accessor :name, :temperature, :humidity, :visibility, :forecast, :url

    @@all = []

    def self.today
    	self.scrape_cities
    end

    def scrape_cities
    	cities = []

    	cities << self.scrape_newyork

    	cities
    	# city_1 = self.new
    	# city_1.name = "New York, NY"
    	# city_1.temperature = "67 degrees F"
    	# city_1.humidity = "43 percent"
    	# city_1.visibility = "7.0 miles"
    	# city_1.forecast = "Partly cloudy"
    	# city_1.url = "https://weather.com/weather/today/l/USNY0996:1:US"

    	# city_2 = self.new
    	# city_2.name = "Boston, MA"
    	# city_2.temperature = "64 degrees F"
    	# city_2.humidity = "10 percent"
    	# city_2.visibility = "10.0 miles"
    	# city_2.forecast = "Sunny"
    	# city_2.url = "https://weather.com/weather/today/l/USMA0046:1:US"

    	# [city_1, city_2]
    end

    def self.scrape_newyork
    	doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USNY0996:1:US"))
        #forecast = doc.css(".today_nowcard-phrase").text
        #temperature = doc.css(".today_nowcard-temp").text
        #feels like = doc.css(".today_nowcard-feels").text
        #high = doc.css(".deg-hilo-nowcard")[0].text
        #low = doc.css(".deg-hilo-nowcard")[1].text
        #humidity = doc.css(".wx-detail-value")[1].text
        #sunrise = doc.css("#dp0-details-sunrise").text
        #sunset = doc.css("#dp0-details-sunset").text

    	binding.pry
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
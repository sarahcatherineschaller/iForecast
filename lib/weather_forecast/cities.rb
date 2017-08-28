
require 'pry'

class WeatherForecast::Cities
	attr_accessor :name, :temperature, :humidity, :visibility, :forecast, :url

    def self.today
    	self.scrape_cities
    end

    def self.scrape_cities
    	cities = []

    	cities << self.scrape_city(url)

    	cities
    end

    def self.scrape_city(url)
    	doc = Nokogiri::HTML(open(url))
        binding.pry
        forecast = doc.css(".today_nowcard-phrase").text
        temperature = doc.css(".today_nowcard-temp").text
        feels like = doc.css(".today_nowcard-feels").text
        high = doc.css(".deg-hilo-nowcard")[0].text
        low = doc.css(".deg-hilo-nowcard")[1].text
        humidity = doc.css(".wx-detail-value")[1].text
        sunrise = doc.css("#dp0-details-sunrise").text
        sunset = doc.css("#dp0-details-sunset").text
    end

end
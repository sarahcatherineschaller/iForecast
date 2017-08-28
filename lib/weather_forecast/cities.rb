
require 'pry'

class WeatherForecast::Cities
	attr_accessor :forecast, :temperature, :feels_like, :high, :low, :humidity, :sunrise, :sunset

    def self.today
    	self.scrape_cities
    end

    def self.scrape_cities
    	cities = []

    	cities << self.scrape_newyork
        cities << self.scrape_boston

    	cities
    end

    def self.scrape_newyork
    	doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USNY0996:1:US"))

        city = self.new
        city.forecast = doc.css(".today_nowcard-phrase").text.downcase
        city.temperature = doc.css(".today_nowcard-temp").text
        city.feels_like = doc.css(".today_nowcard-feels").text
        city.high = doc.css(".deg-hilo-nowcard")[0].text
        city.low = doc.css(".deg-hilo-nowcard")[1].text
        city.humidity = doc.css(".wx-detail-value")[1].text
        city.sunrise = doc.css("#dp0-details-sunrise").text
        city.sunset = doc.css("#dp0-details-sunset").text

        city
    end

    def self.scrape_boston
        doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USMA0046:1:US"))

        city = self.new
        city.forecast = doc.css(".today_nowcard-phrase").text.downcase
        city.temperature = doc.css(".today_nowcard-temp").text
        city.feels_like = doc.css(".today_nowcard-feels").text
        city.high = doc.css(".deg-hilo-nowcard")[0].text
        city.low = doc.css(".deg-hilo-nowcard")[1].text
        city.humidity = doc.css(".wx-detail-value")[1].text
        city.sunrise = doc.css("#dp0-details-sunrise").text
        city.sunset = doc.css("#dp0-details-sunset").text

        city
    end

end
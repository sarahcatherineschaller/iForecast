require 'pry'

class WeatherForecast::Scraper

	def self.scrape_newyork
		doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USNY0996:1:US"))
		doc.css
		binding.pry
	end



	#today_nowcard-phrase


end
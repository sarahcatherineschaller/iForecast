class WeatherForecast::Cities
	attr_accessor :city_name, :temperature, :humidity, :visibility, :forecast, :url

    @@all = []

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
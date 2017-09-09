class WeatherForecast::Cities
	attr_accessor :forecast, :temperature, :feels_like, :high, :low, :humidity, :sunrise, :sunset, :doc

    @@all = []

    def initialize 
        @@all << self

    end

    def self.all 
        @@all 
    end

end
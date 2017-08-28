class WeatherForecast::Cities
	attr_accessor :forecast, :temperature, :feels_like, :high, :low, :humidity, :sunrise, :sunset, :doc

    def self.today
    	self.scrape_cities
    end

    def self.scrape_cities
    	cities = []

    	cities << self.scrape_newyork
        cities << self.scrape_boston
        cities << self.scrape_sanfran
        cities << self.scrape_austin
        cities << self.scrape_seattle
        cities << self.scrape_orlando
        cities << self.scrape_phoenix
        cities << self.scrape_dc
        cities << self.scrape_denver
        cities << self.scrape_hartford

    	cities
    end

    def self.scrape_newyork
    	@doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USNY0996:1:US"))
        self.scrape_city
    end

    def self.scrape_boston
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USMA0046:1:US"))
        self.scrape_city
    end

        def self.scrape_sanfran
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USCA0987:1:US"))
        self.scrape_city
    end

        def self.scrape_austin
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USTX0057:1:US"))
        self.scrape_city
    end

        def self.scrape_seattle
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USWA0395:1:US"))
        self.scrape_city
    end

        def self.scrape_orlando
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USFL0372:1:US"))
        self.scrape_city
    end

        def self.scrape_phoenix
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USAZ0166:1:US"))
        self.scrape_city
    end

        def self.scrape_dc
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USDC0001:1:US"))
        self.scrape_city
    end

        def self.scrape_denver
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USCO0105:1:US"))
        self.scrape_city
    end

        def self.scrape_hartford
        @doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/USCT0094:1:US"))
        self.scrape_city
    end

    def self.scrape_city
        city = self.new

        city.forecast = @doc.css(".today_nowcard-phrase").text.downcase
        city.temperature = @doc.css(".today_nowcard-temp").text
        city.feels_like = @doc.css(".today_nowcard-feels").text.downcase
        city.high = @doc.css(".deg-hilo-nowcard")[0].text
        city.low = @doc.css(".deg-hilo-nowcard")[1].text
        city.humidity = @doc.css(".wx-detail-value")[1].text
        city.sunrise = @doc.css("#dp0-details-sunrise").text
        city.sunset = @doc.css("#dp0-details-sunset").text

        city
    end

end
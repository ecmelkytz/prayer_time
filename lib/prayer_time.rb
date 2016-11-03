require "prayer_time/version"
require "prayer_time/request"

module PrayerTime
  def self.countries
    self::COUNTRIES
  end

  def self.cities(country)
    Request.new.get_cities(country)
  end

  def self.towns(country, city)
    Request.new.get_towns(country, city)
  end

  def self.times(country, city, option = {})
    Request.new.pray_times(country, city, option)
  end
end

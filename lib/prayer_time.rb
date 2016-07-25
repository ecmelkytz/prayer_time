require "prayer_time/version"
require "prayer_time/request"

module PrayerTime

  def self.cities(country)
    Request.new.get_cities(country)
  end

  def self.towns(country, city)
    Request.new.get_towns(country, city)
  end

  def self.times(country, city, town)
    Request.new.pray_times(country, city, town)
  end
end

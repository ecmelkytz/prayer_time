# PrayerTime

This gem obtains to praying times from [Presidency of Religious Affairs](http://www.diyanet.gov.tr/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prayer_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prayer_time

## Usage

```ruby
PrayerTime.cities("TURKIYE")
# => [{"Disabled"=>false, "Group"=>nil, "Selected"=>false, "Text"=>"ADANA", "Value"=>"500"},
# {"Disabled"=>false, "Group"=>nil, "Selected"=>false, "Text"=>"ADIYAMAN", "Value"=>"501"},
# ...

PrayerTime.towns("TURKIYE", "SAMSUN")
# =>[{"Disabled"=>false, "Group"=>nil, "Selected"=>false, "Text"=>"19 MAYIS", "Value"=>"9809"},
# {"Disabled"=>false, "Group"=>nil, "Selected"=>false, "Text"=>"ALAÇAM", "Value"=>"9810"},
# ...

PrayerTime.times("TURKIYE", "SAMSUN", "19 MAYIS")
# => {"Imsak"=>"03:26",
#  "Gunes"=>"05:17",
#  "Ogle"=>"12:49",
#   "Ikindi"=>"16:44",
#   "Aksam"=>"20:09",
#   "Yatsi"=>"21:51",
#   "NextImsak"=>"03:26",
#   "MoonSrc"=>"d7.gif",
#   "HicriTarih"=>"21 Şevval 1437",
#   "MiladiTarih"=>"25.07.2016",
#   "RumiTarih"=>nil,
#   "Enlem"=>0,
#   "Boylam"=>0,
#   "KibleAcisi"=>"169",
#   "UlkeAdi"=>"TÜRKİYE",
#   "SehirAdi"=>"SAMSUN",
#   "KibleSaati"=>"12:26",
#   "GunesBatis"=>"20:01",
#   "GunesDogus"=>"05:24",
#   "ItemId"=>9809,
#   "HolyDaysItem"=>nil}
```
If the country hasn't  any town, something like this:
```ruby
PrayerTime.cities("BOSNA HERSEK")
# =>{"Disabled"=>false, "Group"=>nil, "Selected"=>false, "Text"=>"SARAYBOSNA(sarajevo)", "Value"=>"12029"},
# {"Disabled"=>false, "Group"=>nil, "Selected"=>false, "Text"=>"SREBRENICA", "Value"=>"12003"},
# ...

PrayerTime.towns("BOSNA HERSEK", "SREBRENICA")
# => [ ] // hasn't any town

PrayerTime.times("BOSNA HERSEK", "SREBRENICA" , "")
# => {"Imsak"=>"03:11",
# "Gunes"=>"05:18",
# "Ogle"=>"12:56",
# "Ikindi"=>"16:56",
# "Aksam"=>"20:22",
# "Yatsi"=>"22:15",
# "NextImsak"=>"03:11",
# ...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ecmelkytz/convert_temperature.

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -a -m 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

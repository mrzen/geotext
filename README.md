# Geotext

Geotext extracts country and city mentions from text

Free software: MIT license

Ported From: https://github.com/elyase/geotext

Documentation: https://geotext.readthedocs.org.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geotext'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geotext

## Usage
```ruby
require "geotext"

puts GeoText::parse("This should identify London, United Kingdom, British, Thai China, Moscow, etc")
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrzen/geotext.


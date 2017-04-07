require "geotext/version"

module GeoText
  
  ##
  # Parse a string
  #
  # @param [String] Any text that might contain locations
  #
  # @return [Array] An array of locations
  def self::parse(text)
   
    self::load_index

    {
      cities: @index[:cities].select { |c| text.include? c }.uniq,
      countries: @index[:countries].select { |c| text.include? c }.uniq,
      nationalities: @index[:nationalities].select { |c| text.include? c }.uniq
    }

  end


  ##
  # Returns the index creating if required
  #
  #
  def self::load_index

    @index ||= begin

      countries = self::load_list('countryInfo', col: 4, skip: 1)
      
      cities = self::load_list('cities15000', col: 1)
      city_patches = self::load_list('citypatches')
      cities.concat city_patches

      nationalities = self::load_list('nationalities', seperator: ':')
   
      {
        cities: cities,
        countries: countries,
        nationalities: nationalities
      }

    end

  end


  ##
  # Load data table
  #
  # @param [String] the name of the data file
  #
  # @return [Array(Hash)] An array of data items
  def self::load_list(name, col: 0, seperator: "\t", comment: "#", skip: 0)

    table = []

    File.open(File.dirname(__FILE__) + '/data/' + name + '.txt', "r") do |f|

      counter = 0

      while (row = f.gets)

        if counter >= skip && !row.start_with?(comment)

          columns = row.split seperator
          
          table.push(columns[col].strip.upcase_first)

        end

        counter = counter + 1

      end

    end

    table

  end

end

class String
  def upcase_first
    self.sub(/\S/, &:upcase)
  end
end

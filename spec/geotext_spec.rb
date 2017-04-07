require "spec_helper"

RSpec.describe Geotext do

  it "has a version number" do
    expect(Geotext::VERSION).not_to be nil
  end

  it "finds cities" do
    matches = GeoText::parse("This should list London, Sydney and Beijing")
    expect(matches[:cities].sort).to eql ["London", "Sydney", "Beijing"].sort
  end

  it "finds countries" do
    matches = GeoText::parse("This should list United Kingdom, Australia and China")
    expect(matches[:countries].sort).to eql ["United Kingdom", "Australia", "China"].sort
  end

  it "finds nationalities" do
    matches = GeoText::parse("This should list British, Australian and Chinese")
    expect(matches[:nationalities].sort).to eql ["British", "Australian", "Chinese"].sort
  end

  it "should parse this" do
    matches = GeoText::parse("Stunning Andaman Coastline Thailand Boats Coast Beach Sea")
    puts matches
  end

end

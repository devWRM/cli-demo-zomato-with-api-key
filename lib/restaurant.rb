class Restaurant
  attr_accessor :name, :url, :address, :locality, :city, :zipcode, :cuisines, :rating

  @@all = []

  def initialize(attr_hash)
    # can we refactor this code to make it cleaner?
    @name = attr_hash[:name]
    @url = attr_hash[:url]
    @address = attr_hash[:address]
    @locality = attr_hash[:locality]
    @city = attr_hash[:city]
    @zipcode = attr_hash[:zipcode]
    @cuisines = attr_hash[:cuisines]
    @rating = attr_hash[:rating]
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end

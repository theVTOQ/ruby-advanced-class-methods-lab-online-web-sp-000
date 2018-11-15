class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    existing_song = find_by_name(name)
    if existing_song == nil
      return create_by_name(name)
    else
      return existing_song
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
    @@all
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    song = self.new
    song.name = split[1].chomp(".mp3")
    song.artist_name = split[0]
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end
end

require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  #Class Methods
  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song_by_name = self.new
    new_song_by_name.name = name
    new_song_by_name
  end
  
  def self.create_by_name(name)
    create_by_name = self.new
    create_by_name.name = name
    @@all << create_by_name
    create_by_name
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    split_file_name = file_name.split(' - ')
    artist = split_file_name[0]
    song_name_array = split_file_name[1].split('.mp3')
    song_name = song_name_array[0]
    new_song_from_file = self.new_by_name(song_name)
    new_song_from_file.artist_name = artist
    new_song_from_file
  end

  def self.create_from_filename(file_name)
    split_file_name = file_name.split(' - ')
    artist = split_file_name[0]
    song_name_array = split_file_name[1].split('.mp3')
    song_name = song_name_array[0]
    new_song_from_file = self.create_by_name(song_name)
    new_song_from_file.artist_name = artist
    new_song_from_file
  end

  def self.destroy_all
    @@all.clear 
  end

end

#binding.pry
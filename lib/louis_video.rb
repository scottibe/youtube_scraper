class LouisVideo

   attr_accessor :title, :views, :duration, :byline, :description, :uploaded, :url

  def self.create_from_hash(hash)
    new_from_hash(hash)
  end
  
  def self.new_from_hash(hash)
    video = self.new
    video.title = hash[:title]
    video.views = hash[:views]
    video.uploaded = hash[:uploaded]
    video.url = hash[:url]
    video.byline = hash[:byline]
    video.description = hash[:description]
    video.duration = hash[:duration]
    video
    binding.pry
  end  


end  
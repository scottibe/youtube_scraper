#!/usr/bin/ruby
require_relative './config/environment'

def reload!
  load_all './lib'
  load_all './bin'
end

task :console do
  Pry.start
end

task :scrape_videos do
  puts "please enter the first_name"
  first_name = STDIN.gets.strip
  puts "Please enter the last_name"
  last_name = STDIN.gets.strip
  @lou = VideoScraper.new("https://www.youtube.com/results?search_query=#{first_name}+#{last_name}")
  binding.pry
end  
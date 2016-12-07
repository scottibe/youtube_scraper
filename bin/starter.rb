#!/usr/bin/ruby
require 'pry'
  

class Starter

  def start 
    puts "please enter the first_name"
    first_name = STDIN.gets.strip
    puts "Please enter the last_name"
    last_name = STDIN.gets.strip
    @lou = VideoScraper.new("https://www.youtube.com/results?search_query=#{first_name}+#{last_name}")
    binding.pry
  end


end  